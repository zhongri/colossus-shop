package com.colossus.auth.service;

import com.colossus.auth.service.hystrix.AuthUserRoleServiceHystrix;
import com.colossus.common.model.AuthUserRole;
import com.colossus.common.model.AuthUserRoleExample;
import com.colossus.common.service.BaseService;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* AuthUserRoleService接口
* Created by Tlsy on 2017/3/20.
*/
@FeignClient(value = "auth-user-role-service",fallback = AuthUserRoleServiceHystrix.class)
public interface AuthUserRoleService extends BaseService<AuthUserRole,AuthUserRoleExample> {

    /**
     * 用户角色
     * @param roleIds 角色ids
     * @param userId 用户id
     * @return
     */
    int updateRoleForUser(String[] roleIds, String userId);

}