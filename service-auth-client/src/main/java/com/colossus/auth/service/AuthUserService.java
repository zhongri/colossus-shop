package com.colossus.auth.service;


import com.colossus.auth.service.hystrix.AuthUserServiceHystrix;
import com.colossus.common.model.AuthUser;
import com.colossus.common.model.AuthUserExample;
import com.colossus.common.service.BaseService;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* AuthUserService接口
* Created by Tlsy on 2017/3/20.
*/
@FeignClient(value = "auth-user-service",fallback = AuthUserServiceHystrix.class)
public interface AuthUserService extends BaseService<AuthUser,AuthUserExample>{

    AuthUser createUser(AuthUser AuthUser);

}