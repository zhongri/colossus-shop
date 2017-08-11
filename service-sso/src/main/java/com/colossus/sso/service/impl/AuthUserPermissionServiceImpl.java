package com.colossus.sso.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthUserPermissionMapper;
import com.colossus.common.model.AuthUserPermission;
import com.colossus.common.model.AuthUserPermissionExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.sso.service.AuthUserPermissionService;

public class AuthUserPermissionServiceImpl  extends BaseServiceImpl<AuthUserPermissionMapper,AuthUserPermission,AuthUserPermissionExample> implements AuthUserPermissionService {
    @Override
    public int permission(JSONArray datas, int id) {
        return 0;
    }
}
