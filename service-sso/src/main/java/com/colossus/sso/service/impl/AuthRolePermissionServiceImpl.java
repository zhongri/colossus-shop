package com.colossus.sso.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthRolePermissionMapper;
import com.colossus.common.model.AuthRolePermission;
import com.colossus.common.model.AuthRolePermissionExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.sso.service.AuthRolePermissionService;

public class AuthRolePermissionServiceImpl  extends BaseServiceImpl<AuthRolePermissionMapper,AuthRolePermission,AuthRolePermissionExample> implements AuthRolePermissionService {
    @Override
    public int rolePermission(JSONArray datas, int id) {
        return 0;
    }
}
