package com.colossus.auth.service;

import com.colossus.auth.service.hystrix.AuthOrganizationServiceHystrix;
import com.colossus.common.model.AuthOrganization;
import com.colossus.common.model.AuthOrganizationExample;
import com.colossus.common.service.BaseService;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* AuthOrganizationService接口
* Created by Tlsy on 2017/3/20.
*/
@FeignClient(value = "auth-organization-service",fallback = AuthOrganizationServiceHystrix.class)
public interface AuthOrganizationService extends BaseService<AuthOrganization,AuthOrganizationExample> {

}