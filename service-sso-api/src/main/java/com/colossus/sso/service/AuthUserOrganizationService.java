package com.colossus.sso.service;

import com.colossus.common.model.AuthUserOrganization;
import com.colossus.common.model.AuthUserOrganizationExample;
import com.colossus.common.service.BaseService;

/**
* UpmsUserOrganizationService接口
* Created by shuzheng on 2017/3/20.
*/
public interface AuthUserOrganizationService extends BaseService<AuthUserOrganization,AuthUserOrganizationExample> {

    /**
     * 用户组织
     * @param organizationIds 组织ids
     * @param id 用户id
     * @return
     */
    int organization(String[] organizationIds, int id);

}