package com.colossus.auth.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthPermissionMapper;
import com.colossus.common.model.AuthPermission;
import com.colossus.common.model.AuthPermissionExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthPermissionService;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@Api(value = "authPermission-service",description = "用户权限服务")
public class AuthPermissionServiceImpl extends BaseServiceImpl<AuthPermissionMapper,AuthPermission,AuthPermissionExample> implements AuthPermissionService {
    @Override
    public JSONArray getTreeByRoleId(String roleId) {
        return null;
    }

    @Override
    public JSONArray getTreeByUserId(String userId, Byte type) {
        return null;
    }
}
