package com.colossus.auth.service;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.model.AuthPermission;
import com.colossus.common.model.AuthPermissionExample;
import com.colossus.common.service.BaseService;
import com.colossus.auth.service.hystrix.AuthPermissionServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* UpmsPermissionService接口
* Created by shuzheng on 2017/3/20.
*/
@FeignClient(value = "auth-permission-service",fallback = AuthPermissionServiceHystrix.class)
public interface AuthPermissionService extends BaseService<AuthPermission,AuthPermissionExample> {

    JSONArray getTreeByRoleId(String  roleId);

    JSONArray getTreeByUserId(String  userId, Byte type);

}