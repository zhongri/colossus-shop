package com.colossus.auth.service.hystrix;

import com.colossus.common.dao.AuthUserRoleMapper;
import com.colossus.common.model.AuthUserRole;
import com.colossus.common.model.AuthUserRoleExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.auth.service.AuthUserRoleService;

public class AuthUserRoleServiceHystrix extends BaseServiceHystrix<AuthUserRoleMapper,AuthUserRole,AuthUserRoleExample> implements AuthUserRoleService {
    @Override
    public int role(String[] roleIds, int id) {
        return 0;
    }
}
