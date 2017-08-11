package com.colossus.sso.service.hystrix;

import com.colossus.common.dao.AuthOrganizationMapper;
import com.colossus.common.model.AuthOrganization;
import com.colossus.common.model.AuthOrganizationExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.sso.service.AuthOrganizationService;

public class AuthOrganizationServiceHystrix extends BaseServiceHystrix<AuthOrganizationMapper,AuthOrganization,AuthOrganizationExample>  implements AuthOrganizationService{
}
