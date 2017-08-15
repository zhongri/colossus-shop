package com.colossus.auth.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthRolePermissionMapper;
import com.colossus.common.model.AuthRolePermission;
import com.colossus.common.model.AuthRolePermissionExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthRolePermissionService;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@Api(value = "authRolePermission-service",description = "角色权限服务")
public class AuthRolePermissionServiceImpl  extends BaseServiceImpl<AuthRolePermissionMapper,AuthRolePermission,AuthRolePermissionExample> implements AuthRolePermissionService {

    @Override
    public int rolePermission(JSONArray data, String userId) {
        return 0;
    }
}
