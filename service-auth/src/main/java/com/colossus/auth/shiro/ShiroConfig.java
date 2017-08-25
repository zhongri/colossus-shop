package com.colossus.auth.shiro;

import com.colossus.RedisService;
import com.colossus.common.dao.AuthFilterMapper;
import com.colossus.common.model.AuthFilter;
import com.colossus.common.model.AuthFilterExample;
import com.google.common.collect.Lists;
import org.apache.shiro.authc.pam.AtLeastOneSuccessfulStrategy;
import org.apache.shiro.authc.pam.ModularRealmAuthenticator;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Autowired
    private RedisService redisService;
    @Autowired
    private AuthFilterMapper authFilterMapper;

    @Value("${redisKey.prefix.shiro_session}")
    private String SHIRO_SESSION;

    @Value("${redisKey.expire_time}")
    private Integer EXPIRE_TIME;

    @Bean
    public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();

        // 必须设置 SecurityManager
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        // 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
        shiroFilterFactoryBean.setLoginUrl("/login");
        // 登录成功后要跳转的链接
        shiroFilterFactoryBean.setSuccessUrl("/index");
        // 未授权界面;
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");

        // 权限控制map.
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        // 从数据库获取
        AuthFilterExample example=new AuthFilterExample();
        example.createCriteria().andIdIsNotNull();
        List<AuthFilter> list = authFilterMapper.selectByExample(example);

        for (AuthFilter authFilter : list) {
            filterChainDefinitionMap.put(authFilter.getUrl(),
                    authFilter.getFilter());
        }
        shiroFilterFactoryBean
                .setFilterChainDefinitionMap(filterChainDefinitionMap);
        System.out.println("Shiro拦截器工厂类注入成功");
        return shiroFilterFactoryBean;
    }

    @Bean
    public SecurityManager securityManager(DefaultWebSessionManager sessionManager,CacheManager cacheManager,List<AuthorizingRealm> realms) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        // 设置realm.
        securityManager.setRealms(Lists.newArrayList(realms));
        // 自定义缓存实现 使用redis
        securityManager.setCacheManager(cacheManager);
        // 自定义session管理 使用redis
        securityManager.setSessionManager(sessionManager);
        ModularRealmAuthenticator authenticator=new ModularRealmAuthenticator();
        authenticator.setRealms(Lists.newArrayList(realms));
        authenticator.setAuthenticationStrategy(new AtLeastOneSuccessfulStrategy());
        securityManager.setAuthenticator(authenticator);
        //todo rememberManager
        return securityManager;
    }

    @Bean
    public CacheManager cacheManager(RedisCache redisCache){
        return new RedisCacheManager(redisCache);
    }

    @Bean
    public RedisCache cache(){
        return new RedisCache("shiro_redis",redisService);
    }

    /**
     * 身份认证realm; (这个需要自己写，账号密码校验；权限等)
     *
     * @return
     */
    @Bean
    public List<AuthorizingRealm> normalRealm(CacheManager cacheManager) {
        List<AuthorizingRealm> result= Lists.newArrayList();
        NormalRealm normalRealm=new NormalRealm();
        normalRealm.setCacheManager(cacheManager);
        normalRealm.setCredentialsMatcher(new NormalCredentialsMather(cacheManager,"SHA-1",1024));
        normalRealm.setCachingEnabled(true);
        result.add(new NormalRealm());
        return result;
    }


    /**
     * RedisSessionDAO shiro sessionDao层的实现 通过redis
     */
    @Bean
    public RedisSessionDao redisSessionDAO() {
        return new RedisSessionDao(redisService,SHIRO_SESSION,EXPIRE_TIME);
    }

    /**
     * shiro session的管理
     */
    @Bean
    public DefaultWebSessionManager SessionManager(RedisSessionDao redisSessionDao) {
        DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
        sessionManager.setSessionDAO(redisSessionDao);
        return sessionManager;
    }
}
