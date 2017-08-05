package com.colosuss.dao;

import com.colosuss.model.HotWord;
import com.colosuss.model.HotWordExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbHotWordsMapper {
    int countByExample(HotWordExample example);

    int deleteByExample(HotWordExample example);

    int deleteByPrimaryKey(Long id);

    int insert(HotWord record);

    int insertSelective(HotWord record);

    List<HotWord> selectByExample(HotWordExample example);

    HotWord selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") HotWord record, @Param("example") HotWordExample example);

    int updateByExample(@Param("record") HotWord record, @Param("example") HotWordExample example);

    int updateByPrimaryKeySelective(HotWord record);

    int updateByPrimaryKey(HotWord record);
}