package com.colosuss.dao;

import org.apache.ibatis.annotations.Param;
import com.colosuss.model.ManageUser;
import com.colosuss.model.ManageUserExample;

import java.util.List;

public interface TbManageUserMapper {
    int countByExample(ManageUserExample example);

    int deleteByExample(ManageUserExample example);

    int deleteByPrimaryKey(Long id);

    int insert(ManageUser record);

    int insertSelective(ManageUser record);

    List<ManageUser> selectByExample(ManageUserExample example);

    ManageUser selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") ManageUser record, @Param("example") ManageUserExample example);

    int updateByExample(@Param("record") ManageUser record, @Param("example") ManageUserExample example);

    int updateByPrimaryKeySelective(ManageUser record);

    int updateByPrimaryKey(ManageUser record);
}