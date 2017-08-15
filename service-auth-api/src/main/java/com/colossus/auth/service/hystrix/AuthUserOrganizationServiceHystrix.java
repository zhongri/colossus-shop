package com.colossus.auth.service.hystrix;

import com.colossus.common.dao.AuthUserOrganizationMapper;
import com.colossus.common.model.AuthUserOrganization;
import com.colossus.common.model.AuthUserOrganizationExample;
import com.colossus.common.service.hystrix.BaseServiceHystrix;
import com.colossus.auth.service.AuthUserOrganizationService;

public class AuthUserOrganizationServiceHystrix extends BaseServiceHystrix<AuthUserOrganizationMapper,AuthUserOrganization,AuthUserOrganizationExample> implements AuthUserOrganizationService{
    @Override
    public int organization(String[] organizationIds, int id) {
        return 0;
    }
}
