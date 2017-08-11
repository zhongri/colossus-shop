package com.colossus.sso.service;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.model.AuthUserPermission;
import com.colossus.common.model.AuthUserPermissionExample;
import com.colossus.common.service.BaseService;

/**
* UpmsUserPermissionService接口
* Created by shuzheng on 2017/3/20.
*/
public interface AuthUserPermissionService extends BaseService<AuthUserPermission,AuthUserPermissionExample> {

    /**
     * 用户权限
     * @param datas 权限数据
     * @param id 用户id
     * @return
     */
    int permission(JSONArray datas, int id);

}