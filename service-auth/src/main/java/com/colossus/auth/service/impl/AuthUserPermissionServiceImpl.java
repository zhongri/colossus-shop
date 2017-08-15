package com.colossus.auth.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthUserPermissionMapper;
import com.colossus.common.model.AuthUserPermission;
import com.colossus.common.model.AuthUserPermissionExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthUserPermissionService;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RefreshScope
@Api(value = "authUserPermission-service",description = "用户权限服务")
public class AuthUserPermissionServiceImpl  extends BaseServiceImpl<AuthUserPermissionMapper,AuthUserPermission,AuthUserPermissionExample> implements AuthUserPermissionService {

    @Override
    public int permission(JSONArray datas, String userId) {
        return 0;
    }
}
