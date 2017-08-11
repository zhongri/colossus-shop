package com.colossus.sso.service;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.model.AuthPermission;
import com.colossus.common.model.AuthPermissionExample;
import com.colossus.common.service.BaseService;

/**
* UpmsPermissionService接口
* Created by shuzheng on 2017/3/20.
*/
public interface AuthPermissionService extends BaseService<AuthPermission,AuthPermissionExample> {

    JSONArray getTreeByRoleId(Integer roleId);

    JSONArray getTreeByUserId(Integer usereId, Byte type);

}