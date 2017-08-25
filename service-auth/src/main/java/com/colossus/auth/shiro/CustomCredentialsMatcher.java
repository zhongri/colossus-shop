package com.colossus.auth.shiro;


import com.colossus.auth.service.AuthUserService;
import com.colossus.common.model.AuthUser;
import com.colossus.common.model.AuthUserExample;
import com.colossus.common.utils.AppConfig;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author Tlsy
 * @version commerce 0.0.1
 * @date 2017/4/19  17:01
 */
public abstract class CustomCredentialsMatcher extends HashedCredentialsMatcher {

    @Autowired
    private AuthUserService authUserService;


    protected void setTenantInfo(String username) throws AuthenticationException {

        AuthUserExample example=new AuthUserExample();
        example.createCriteria().andUsernameEqualTo(username);
        AuthUser user=authUserService.selectFirstByExample(example);
        if(user==null){
            throw new AuthenticationException("此Token关联的用户不存在");
        }
        if(user.getLocked() != 0){
            throw new AuthenticationException("用户状态不正确");
        }
        Session session = SecurityUtils.getSubject().getSession();
        session.setAttribute(AppConfig.USER_SESSION, user);
        SecurityUtils.getSubject().isPermitted("-1");//强制授权
    }
}
