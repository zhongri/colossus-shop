package com.colossus.sso.service.impl;

import com.colossus.common.dao.AuthUserMapper;
import com.colossus.common.model.AuthUser;
import com.colossus.common.model.AuthUserExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.sso.service.AuthUserService;

public class AuthUserServiceImpl extends BaseServiceImpl<AuthUserMapper,AuthUser,AuthUserExample> implements AuthUserService {
    @Override
    public AuthUser createUser(AuthUser AuthUser) {
        return null;
    }
}
