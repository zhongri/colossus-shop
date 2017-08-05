package com.colosuss.dao;

import com.colosuss.model.CategoryImage;
import com.colosuss.model.CategoryImageExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbCategoryImageMapper {
    int countByExample(CategoryImageExample example);

    int deleteByExample(CategoryImageExample example);

    int deleteByPrimaryKey(Long id);

    int insert(CategoryImage record);

    int insertSelective(CategoryImage record);

    List<CategoryImage> selectByExample(CategoryImageExample example);

    CategoryImage selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") CategoryImage record, @Param("example") CategoryImageExample example);

    int updateByExample(@Param("record") CategoryImage record, @Param("example") CategoryImageExample example);

    int updateByPrimaryKeySelective(CategoryImage record);

    int updateByPrimaryKey(CategoryImage record);
}