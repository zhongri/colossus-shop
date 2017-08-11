package com.colossus.sso.service.hystrix;

import com.colossus.common.dao.AuthLogMapper;
import com.colossus.common.model.AuthLog;
import com.colossus.common.model.AuthLogExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.sso.service.AuthLogService;

public class AuthLogServiceHystrix extends BaseServiceHystrix<AuthLogMapper,AuthLog,AuthLogExample> implements AuthLogService {
}
