package com.colosuss.dao;

import com.colosuss.model.CategorySecondary;
import org.apache.ibatis.annotations.Param;
import com.colosuss.model.CategorySecondaryExample;

import java.util.List;

public interface TbCategorySecondaryMapper {
    int countByExample(CategorySecondaryExample example);

    int deleteByExample(CategorySecondaryExample example);

    int deleteByPrimaryKey(Long id);

    int insert(CategorySecondary record);

    int insertSelective(CategorySecondary record);

    List<CategorySecondary> selectByExample(CategorySecondaryExample example);

    CategorySecondary selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") CategorySecondary record, @Param("example") CategorySecondaryExample example);

    int updateByExample(@Param("record") CategorySecondary record, @Param("example") CategorySecondaryExample example);

    int updateByPrimaryKeySelective(CategorySecondary record);

    int updateByPrimaryKey(CategorySecondary record);
}