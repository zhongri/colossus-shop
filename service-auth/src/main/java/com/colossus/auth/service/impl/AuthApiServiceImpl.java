package com.colossus.auth.service.impl;

import com.colossus.common.model.*;
import com.colossus.auth.service.AuthApiService;

import java.util.List;

public class AuthApiServiceImpl implements AuthApiService {
    @Override
    public List<AuthPermission> selectAuthPermissionByAuthUserId(Integer AuthUserId) {
        return null;
    }

    @Override
    public List<AuthPermission> selectAuthPermissionByAuthUserIdByCache(Integer AuthUserId) {
        return null;
    }

    @Override
    public List<AuthRole> selectAuthRoleByAuthUserId(Integer AuthUserId) {
        return null;
    }

    @Override
    public List<AuthRole> selectAuthRoleByAuthUserIdByCache(Integer AuthUserId) {
        return null;
    }

    @Override
    public List<AuthRolePermission> selectAuthRolePermisstionByAuthRoleId(Integer AuthRoleId) {
        return null;
    }

    @Override
    public List<AuthUserPermission> selectAuthUserPermissionByAuthUserId(Integer AuthUserId) {
        return null;
    }

    @Override
    public List<AuthSystem> selectAuthSystemByExample(AuthSystemExample AuthSystemExample) {
        return null;
    }

    @Override
    public List<AuthOrganization> selectAuthOrganizationByExample(AuthOrganizationExample AuthOrganizationExample) {
        return null;
    }

    @Override
    public AuthUser selectAuthUserByUsername(String username) {
        return null;
    }

    @Override
    public int insertAuthLogSelective(AuthLog record) {
        return 0;
    }
}
