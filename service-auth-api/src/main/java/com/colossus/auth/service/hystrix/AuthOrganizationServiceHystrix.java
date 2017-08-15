package com.colossus.auth.service.hystrix;

import com.colossus.common.dao.AuthOrganizationMapper;
import com.colossus.common.model.AuthOrganization;
import com.colossus.common.model.AuthOrganizationExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.auth.service.AuthOrganizationService;

public class AuthOrganizationServiceHystrix extends BaseServiceHystrix<AuthOrganizationMapper,AuthOrganization,AuthOrganizationExample>  implements AuthOrganizationService{
}
