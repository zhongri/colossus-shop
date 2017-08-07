package com.colossus.common.model;

import lombok.Data;

import java.util.Date;

@Data
public class Category extends BaseModel {
    private static final long serialVersionUID = -8793792059624542982L;
    private String id;

    /**
     * 名字
     *
     * @mbg.generated
     */
    private String name;

    /**
     * 排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
     *
     * @mbg.generated
     */
    private Integer sortOrder;

    private Date createTime;

    private Date updateTime;

}