package com.colossus.auth.service.hystrix;

import com.colossus.common.dao.AuthRoleMapper;
import com.colossus.common.model.AuthRole;
import com.colossus.common.model.AuthRoleExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.auth.service.AuthRoleService;

public class AuthRoleServiceHystrix extends BaseServiceHystrix<AuthRoleMapper,AuthRole,AuthRoleExample> implements AuthRoleService {
}
