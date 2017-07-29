package cn.binux.dao;

import org.apache.ibatis.annotations.Param;
import cn.binux.model.TbUserAddr;
import cn.binux.model.TbUserAddrExample;

import java.util.List;

public interface TbUserAddrMapper {
    int countByExample(TbUserAddrExample example);

    int deleteByExample(TbUserAddrExample example);

    int deleteByPrimaryKey(String addrId);

    int insert(TbUserAddr record);

    int insertSelective(TbUserAddr record);

    List<TbUserAddr> selectByExample(TbUserAddrExample example);

    TbUserAddr selectByPrimaryKey(String addrId);

    int updateByExampleSelective(@Param("record") TbUserAddr record, @Param("example") TbUserAddrExample example);

    int updateByExample(@Param("record") TbUserAddr record, @Param("example") TbUserAddrExample example);

    int updateByPrimaryKeySelective(TbUserAddr record);

    int updateByPrimaryKey(TbUserAddr record);
}