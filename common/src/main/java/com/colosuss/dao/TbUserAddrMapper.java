package com.colosuss.dao;

import org.apache.ibatis.annotations.Param;
import com.colosuss.model.UserAddr;
import com.colosuss.model.UserAddrExample;

import java.util.List;

public interface TbUserAddrMapper {
    int countByExample(UserAddrExample example);

    int deleteByExample(UserAddrExample example);

    int deleteByPrimaryKey(String addrId);

    int insert(UserAddr record);

    int insertSelective(UserAddr record);

    List<UserAddr> selectByExample(UserAddrExample example);

    UserAddr selectByPrimaryKey(String addrId);

    int updateByExampleSelective(@Param("record") UserAddr record, @Param("example") UserAddrExample example);

    int updateByExample(@Param("record") UserAddr record, @Param("example") UserAddrExample example);

    int updateByPrimaryKeySelective(UserAddr record);

    int updateByPrimaryKey(UserAddr record);
}