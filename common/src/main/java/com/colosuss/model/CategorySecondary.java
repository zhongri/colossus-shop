package com.colosuss.model;

import lombok.Data;

@Data
public class CategorySecondary extends BaseModel {

    private static final long serialVersionUID = -8837306796627727500L;
    private String cid;

    private Long parentId;

    private String name;

    private String url;

    private Integer status;

    private Integer sortOrder;

    private Boolean isParent;

}