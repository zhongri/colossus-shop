package com.colossus.auth.service.hystrix;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.dao.AuthRolePermissionMapper;
import com.colossus.common.model.AuthRolePermission;
import com.colossus.common.model.AuthRolePermissionExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.auth.service.AuthRolePermissionService;

public class AuthRolePermissionServiceHystrix extends BaseServiceHystrix<AuthRolePermissionMapper,AuthRolePermission,AuthRolePermissionExample> implements AuthRolePermissionService {

    @Override
    public int rolePermission(JSONArray data, String userId) {
        return 0;
    }
}
