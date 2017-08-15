package com.colossus.auth.service.impl;

import com.colossus.common.dao.AuthUserMapper;
import com.colossus.common.model.AuthUser;
import com.colossus.common.model.AuthUserExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthUserService;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@Api(value = "authUser-service",description = "用户服务")
public class AuthUserServiceImpl extends BaseServiceImpl<AuthUserMapper,AuthUser,AuthUserExample> implements AuthUserService {
    @Override
    public AuthUser createUser(AuthUser AuthUser) {
        return null;
    }
}
