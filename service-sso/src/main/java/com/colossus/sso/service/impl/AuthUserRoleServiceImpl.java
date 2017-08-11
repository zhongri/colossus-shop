package com.colossus.sso.service.impl;

import com.colossus.common.dao.AuthUserRoleMapper;
import com.colossus.common.model.AuthUserRole;
import com.colossus.common.model.AuthUserRoleExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.sso.service.AuthUserRoleService;

public class AuthUserRoleServiceImpl extends BaseServiceImpl<AuthUserRoleMapper,AuthUserRole,AuthUserRoleExample> implements AuthUserRoleService {
    @Override
    public int role(String[] roleIds, int id) {
        return 0;
    }
}
