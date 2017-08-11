package com.colossus.sso.service.hystrix;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthPermissionMapper;
import com.colossus.common.model.AuthPermission;
import com.colossus.common.model.AuthPermissionExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.sso.service.AuthPermissionService;

public class AuthPermissionServiceHystrix extends BaseServiceHystrix<AuthPermissionMapper,AuthPermission,AuthPermissionExample> implements AuthPermissionService {
    @Override
    public JSONArray getTreeByRoleId(Integer roleId) {
        return null;
    }

    @Override
    public JSONArray getTreeByUserId(Integer usereId, Byte type) {
        return null;
    }
}
