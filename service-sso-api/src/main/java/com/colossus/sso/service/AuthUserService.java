package com.colossus.sso.service;


import com.colossus.common.model.AuthUser;
import com.colossus.common.model.AuthUserExample;
import com.colossus.common.service.BaseService;

/**
* AuthUserService接口
* Created by shuzheng on 2017/3/20.
*/
public interface AuthUserService extends BaseService<AuthUser,AuthUserExample>{

    AuthUser createUser(AuthUser AuthUser);

}