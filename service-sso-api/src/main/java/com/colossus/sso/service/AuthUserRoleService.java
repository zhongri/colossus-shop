package com.colossus.sso.service;

import com.colossus.common.model.AuthUserRole;
import com.colossus.common.model.AuthUserRoleExample;
import com.colossus.common.service.BaseService;

/**
* AuthUserRoleService接口
* Created by shuzheng on 2017/3/20.
*/
public interface AuthUserRoleService extends BaseService<AuthUserRole,AuthUserRoleExample> {

    /**
     * 用户角色
     * @param roleIds 角色ids
     * @param id 用户id
     * @return
     */
    int role(String[] roleIds, int id);

}