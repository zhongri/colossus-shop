package com.colossus.auth.service;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.model.AuthRolePermission;
import com.colossus.common.model.AuthRolePermissionExample;
import com.colossus.common.service.BaseService;
import com.colossus.auth.service.hystrix.AuthRolePermissionServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* UpmsRolePermissionService接口
* Created by shuzheng on 2017/3/20.
*/
@FeignClient(value = "auth-role-permission-service",fallback = AuthRolePermissionServiceHystrix.class)
public interface AuthRolePermissionService  extends BaseService<AuthRolePermission,AuthRolePermissionExample> {

    /**
     * 角色权限
     * @param datas 权限数据
     * @param id 角色id
     * @return
     */
    int rolePermission(JSONArray datas, int id);

}