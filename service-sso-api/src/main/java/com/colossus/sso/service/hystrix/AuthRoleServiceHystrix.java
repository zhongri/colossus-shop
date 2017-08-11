package com.colossus.sso.service.hystrix;

import com.colossus.common.dao.AuthRoleMapper;
import com.colossus.common.model.AuthRole;
import com.colossus.common.model.AuthRoleExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.sso.service.AuthRoleService;

public class AuthRoleServiceHystrix extends BaseServiceHystrix<AuthRoleMapper,AuthRole,AuthRoleExample> implements AuthRoleService {
}
