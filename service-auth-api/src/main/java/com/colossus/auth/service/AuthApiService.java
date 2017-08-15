package com.colossus.auth.service;


import com.colossus.common.model.*;
import com.colossus.auth.service.hystrix.AuthApiServiceHystrix;
import org.springframework.cloud.netflix.feign.FeignClient;

import java.util.List;

/**
 * Auth系统接口
 * Created by shuzheng on 2017/2/11.
 */
@FeignClient(value = "auth-api-service",fallback = AuthApiServiceHystrix.class)
public interface AuthApiService {

    /**
     * 根据用户id获取所拥有的权限(用户和角色权限合集)
     * @param AuthUserId
     * @return
     */
    List<AuthPermission> selectAuthPermissionByAuthUserId(Integer AuthUserId);

    /**
     * 根据用户id获取所拥有的权限(用户和角色权限合集)
     * @param AuthUserId
     * @return
     */
    List<AuthPermission> selectAuthPermissionByAuthUserIdByCache(Integer AuthUserId);

    /**
     * 根据用户id获取所属的角色
     * @param AuthUserId
     * @return
     */
    List<AuthRole> selectAuthRoleByAuthUserId(Integer AuthUserId);

    /**
     * 根据用户id获取所属的角色
     * @param AuthUserId
     * @return
     */
    List<AuthRole> selectAuthRoleByAuthUserIdByCache(Integer AuthUserId);

    /**
     * 根据角色id获取所拥有的权限
     * @param AuthRoleId
     * @return
     */
    List<AuthRolePermission> selectAuthRolePermisstionByAuthRoleId(Integer AuthRoleId);

    /**
     * 根据用户id获取所拥有的权限
     * @param AuthUserId
     * @return
     */
    List<AuthUserPermission> selectAuthUserPermissionByAuthUserId(Integer AuthUserId);

    /**
     * 根据条件获取系统数据
     * @param AuthSystemExample
     * @return
     */
    List<AuthSystem> selectAuthSystemByExample(AuthSystemExample AuthSystemExample);

    /**
     * 根据条件获取组织数据
     * @param AuthOrganizationExample
     * @return
     */
    List<AuthOrganization> selectAuthOrganizationByExample(AuthOrganizationExample AuthOrganizationExample);

    /**
     * 根据username获取AuthUser
     * @param username
     * @return
     */
    AuthUser selectAuthUserByUsername(String username);

    /**
     * 写入操作日志
     * @param record
     * @return
     */
    int insertAuthLogSelective(AuthLog record);

}
