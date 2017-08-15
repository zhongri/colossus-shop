package com.colossus.auth.service.impl;

import com.colossus.common.dao.AuthUserRoleMapper;
import com.colossus.common.model.AuthUserRole;
import com.colossus.common.model.AuthUserRoleExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthUserRoleService;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@Api(value = "authUserRole-service",description = "用户角色服务")
public class AuthUserRoleServiceImpl extends BaseServiceImpl<AuthUserRoleMapper,AuthUserRole,AuthUserRoleExample> implements AuthUserRoleService {

    @Override
    public int role(String[] roleIds, String userId) {
        return 0;
    }
}
