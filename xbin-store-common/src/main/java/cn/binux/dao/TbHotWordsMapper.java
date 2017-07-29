package cn.binux.dao;

import org.apache.ibatis.annotations.Param;
import cn.binux.model.TbHotWords;
import cn.binux.model.TbHotWordsExample;

import java.util.List;

public interface TbHotWordsMapper {
    int countByExample(TbHotWordsExample example);

    int deleteByExample(TbHotWordsExample example);

    int deleteByPrimaryKey(Long id);

    int insert(TbHotWords record);

    int insertSelective(TbHotWords record);

    List<TbHotWords> selectByExample(TbHotWordsExample example);

    TbHotWords selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") TbHotWords record, @Param("example") TbHotWordsExample example);

    int updateByExample(@Param("record") TbHotWords record, @Param("example") TbHotWordsExample example);

    int updateByPrimaryKeySelective(TbHotWords record);

    int updateByPrimaryKey(TbHotWords record);
}