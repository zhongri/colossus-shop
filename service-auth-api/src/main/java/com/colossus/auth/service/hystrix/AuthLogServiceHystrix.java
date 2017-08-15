package com.colossus.auth.service.hystrix;

import com.colossus.common.dao.AuthLogMapper;
import com.colossus.common.model.AuthLog;
import com.colossus.common.model.AuthLogExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.auth.service.AuthLogService;

public class AuthLogServiceHystrix extends BaseServiceHystrix<AuthLogMapper,AuthLog,AuthLogExample> implements AuthLogService {
}
