package com.colosuss.dao;

import org.apache.ibatis.annotations.Param;
import com.colosuss.model.Order;
import com.colosuss.model.OrderExample;

import java.util.List;

public interface TbOrderMapper {
    int countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(String orderId);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(String orderId);

    int updateByExampleSelective(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Order record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}