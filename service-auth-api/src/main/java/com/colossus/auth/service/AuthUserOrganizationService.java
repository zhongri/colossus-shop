package com.colossus.auth.service;

import com.colossus.common.model.AuthUserOrganization;
import com.colossus.common.model.AuthUserOrganizationExample;
import com.colossus.common.service.BaseService;
import com.colossus.auth.service.hystrix.AuthUserOrganizationServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* UpmsUserOrganizationService接口
* Created by shuzheng on 2017/3/20.
*/
@FeignClient(value = "auth-user-organization-service",fallback = AuthUserOrganizationServiceHystrix.class)
public interface AuthUserOrganizationService extends BaseService<AuthUserOrganization,AuthUserOrganizationExample> {

    /**
     * 用户组织
     * @param organizationIds 组织ids
     * @param userId 用户id
     * @return
     */
    int organization(String[] organizationIds, String userId);

}