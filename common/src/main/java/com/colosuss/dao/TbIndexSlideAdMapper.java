package com.colosuss.dao;

import org.apache.ibatis.annotations.Param;
import com.colosuss.model.TbIndexSlideAd;
import com.colosuss.model.TbIndexSlideAdExample;

import java.util.List;

public interface TbIndexSlideAdMapper {
    int countByExample(TbIndexSlideAdExample example);

    int deleteByExample(TbIndexSlideAdExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbIndexSlideAd record);

    int insertSelective(TbIndexSlideAd record);

    List<TbIndexSlideAd> selectByExample(TbIndexSlideAdExample example);

    TbIndexSlideAd selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbIndexSlideAd record, @Param("example") TbIndexSlideAdExample example);

    int updateByExample(@Param("record") TbIndexSlideAd record, @Param("example") TbIndexSlideAdExample example);

    int updateByPrimaryKeySelective(TbIndexSlideAd record);

    int updateByPrimaryKey(TbIndexSlideAd record);
}