package com.colosuss.model;

import lombok.Data;

@Data
public class CategoryImage extends BaseModel{


    private static final long serialVersionUID = -1252316518340391158L;
    private String cid;

    private String name;

    private String url;

    private Integer littleOrBig;

    private Integer status;

    private String imageUrl;

    private Integer sortOrder;


}