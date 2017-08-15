package com.colossus.auth.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthPermissionMapper;
import com.colossus.common.model.AuthPermission;
import com.colossus.common.model.AuthPermissionExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthPermissionService;

public class AuthPermissionServiceImpl extends BaseServiceImpl<AuthPermissionMapper,AuthPermission,AuthPermissionExample> implements AuthPermissionService {
    @Override
    public JSONArray getTreeByRoleId(Integer roleId) {
        return null;
    }

    @Override
    public JSONArray getTreeByUserId(Integer usereId, Byte type) {
        return null;
    }
}
