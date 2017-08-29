package com.colossus.auth.service;

import com.colossus.auth.service.hystrix.AuthSystemServiceHystrix;
import com.colossus.common.model.AuthSystem;
import com.colossus.common.model.AuthSystemExample;
import com.colossus.common.service.BaseService;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* AuthSystemService接口
* Created by Tlsy on 2017/3/20.
*/
@FeignClient(value = "auth-system-service",fallback = AuthSystemServiceHystrix.class)
public interface AuthSystemService extends BaseService<AuthSystem,AuthSystemExample> {

}