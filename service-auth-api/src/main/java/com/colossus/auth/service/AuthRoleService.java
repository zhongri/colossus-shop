package com.colossus.auth.service;

import com.colossus.common.model.AuthRole;
import com.colossus.common.model.AuthRoleExample;
import com.colossus.common.service.BaseService;
import com.colossus.auth.service.hystrix.AuthRoleServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* UpmsRoleService接口
* Created by shuzheng on 2017/3/20.
*/
@FeignClient(value = "auth-role-service",fallback = AuthRoleServiceHystrix.class)
public interface AuthRoleService extends BaseService<AuthRole,AuthRoleExample> {

}