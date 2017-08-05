package com.colosuss.dao;

import org.apache.ibatis.annotations.Param;
import com.colosuss.model.IndexSlideAd;
import com.colosuss.model.IndexSlideAdExample;

import java.util.List;

public interface TbIndexSlideAdMapper {
    int countByExample(IndexSlideAdExample example);

    int deleteByExample(IndexSlideAdExample example);

    int deleteByPrimaryKey(Long id);

    int insert(IndexSlideAd record);

    int insertSelective(IndexSlideAd record);

    List<IndexSlideAd> selectByExample(IndexSlideAdExample example);

    IndexSlideAd selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") IndexSlideAd record, @Param("example") IndexSlideAdExample example);

    int updateByExample(@Param("record") IndexSlideAd record, @Param("example") IndexSlideAdExample example);

    int updateByPrimaryKeySelective(IndexSlideAd record);

    int updateByPrimaryKey(IndexSlideAd record);
}