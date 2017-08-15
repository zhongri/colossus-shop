package com.colossus.auth.service.impl;

import com.colossus.common.dao.AuthLogMapper;
import com.colossus.common.model.AuthLog;
import com.colossus.common.model.AuthLogExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthLogService;

public class AuthLogServiceImpl extends BaseServiceImpl<AuthLogMapper,AuthLog,AuthLogExample> implements AuthLogService {
}
