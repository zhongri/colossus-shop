package com.colossus.sso.service.impl;

import com.colossus.common.dao.AuthUserOrganizationMapper;
import com.colossus.common.model.AuthUserOrganization;
import com.colossus.common.model.AuthUserOrganizationExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.sso.service.AuthUserOrganizationService;

public class AuthUserOrganizationServiceImpl extends BaseServiceImpl<AuthUserOrganizationMapper,AuthUserOrganization,AuthUserOrganizationExample> implements AuthUserOrganizationService{
    @Override
    public int organization(String[] organizationIds, int id) {
        return 0;
    }
}
