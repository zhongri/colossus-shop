package com.colossus.sso.service.impl;

import com.colossus.common.dao.AuthLogMapper;
import com.colossus.common.model.AuthLog;
import com.colossus.common.model.AuthLogExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.sso.service.AuthLogService;

public class AuthLogServiceImpl extends BaseServiceImpl<AuthLogMapper,AuthLog,AuthLogExample> implements AuthLogService {
}
