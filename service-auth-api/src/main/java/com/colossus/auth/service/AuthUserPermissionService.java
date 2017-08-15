package com.colossus.auth.service;

import com.alibaba.fastjson.JSONArray;
import com.colossus.common.model.AuthUserPermission;
import com.colossus.common.model.AuthUserPermissionExample;
import com.colossus.common.service.BaseService;
import com.colossus.auth.service.hystrix.AuthUserPermissionServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* AuthUserPermissionService接口
* Created by Tlsy on 2017/3/20.
*/
@FeignClient(value = "auth-user-permission-service",fallback = AuthUserPermissionServiceHystrix.class)
public interface AuthUserPermissionService extends BaseService<AuthUserPermission,AuthUserPermissionExample> {

    /**
     * 用户权限
     * @param datas 权限数据
     * @param userId 用户id
     * @return
     */
    int permission(JSONArray datas, String userId);

}