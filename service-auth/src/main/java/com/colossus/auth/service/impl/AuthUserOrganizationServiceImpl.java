package com.colossus.auth.service.impl;

import com.colossus.common.dao.AuthUserOrganizationMapper;
import com.colossus.common.model.AuthUserOrganization;
import com.colossus.common.model.AuthUserOrganizationExample;
import com.colossus.common.service.impl.BaseServiceImpl;
import com.colossus.auth.service.AuthUserOrganizationService;
import io.swagger.annotations.Api;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RestController;

@RefreshScope
@RestController
@Api(value = "authUserOrganization-service",description = "用户组织服务")
public class AuthUserOrganizationServiceImpl extends BaseServiceImpl<AuthUserOrganizationMapper,AuthUserOrganization,AuthUserOrganizationExample> implements AuthUserOrganizationService{

    @Override
    public int organization(String[] organizationIds, String userId) {
        return 0;
    }
}
