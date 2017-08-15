package com.colossus.auth.service;

import com.colossus.common.model.AuthLog;
import com.colossus.common.model.AuthLogExample;
import com.colossus.common.service.BaseService;
import com.colossus.auth.service.hystrix.AuthLogServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

/**
* UpmsLogService接口
* Created by shuzheng on 2017/3/20.
*/
@FeignClient(value = "auth-log-service",fallback = AuthLogServiceHystrix.class)
public interface AuthLogService extends BaseService<AuthLog,AuthLogExample> {

}