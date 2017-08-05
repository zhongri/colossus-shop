package com.colosuss.model;

import lombok.Data;

@Data
public class ContentCategory extends BaseModel{
    private static final long serialVersionUID = -6962257606034140940L;
    private Long parentId;

    private String name;

    private Integer status;

    private Integer sortOrder;

    private Boolean isParent;


}