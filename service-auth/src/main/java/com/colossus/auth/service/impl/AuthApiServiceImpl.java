package com.colossus.auth.service.impl;

import com.colossus.auth.service.AuthApiService;
import com.colossus.common.dao.AuthUserMapper;
import com.colossus.common.dao.AuthUserPermissionMapper;
import com.colossus.common.model.*;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@Api(value = "authApi-service",description = "权限基本服务")
@RefreshScope
public class AuthApiServiceImpl implements AuthApiService {
    @Autowired
    private AuthUserMapper authUserMapper;
    @Autowired
    private AuthUserPermissionMapper authUserPermissionMapper;
    @Override
    public List<AuthPermission> selectAuthPermissionByAuthUserId(String  authUserId) {
        AuthUser user=authUserMapper.selectByPrimaryKey(authUserId);
        return null;
    }

    @Override
    public List<AuthPermission> selectAuthPermissionByAuthUserIdByCache(String authUserId) {
        return null;
    }

    @Override
    public List<AuthRole> selectAuthRoleByAuthUserId(String authUserId) {
        return null;
    }

    @Override
    public List<AuthRole> selectAuthRoleByAuthUserIdByCache(String authUserId) {
        return null;
    }

    @Override
    public List<AuthRolePermission> selectAuthRolePermissionByAuthRoleId(String authRoleId) {
        return null;
    }

    @Override
    public List<AuthUserPermission> selectAuthUserPermissionByAuthUserId(String authUserId) {
        return null;
    }

    @Override
    public List<AuthSystem> selectAuthSystemByExample(AuthSystemExample authSystemExample) {
        return null;
    }

    @Override
    public List<AuthOrganization> selectAuthOrganizationByExample(AuthOrganizationExample authOrganizationExample) {
        return null;
    }

    @Override
    public AuthUser selectAuthUserByUsername(String username) {
        return null;
    }

    @Override
    public int insertAuthLogSelective(AuthLog authLog) {
        return 0;
    }
}
