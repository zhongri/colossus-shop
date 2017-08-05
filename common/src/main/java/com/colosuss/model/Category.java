package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class Category extends BaseModel {

    private static final long serialVersionUID = 8861413691836158565L;
    private String name;

    private Integer sortOrder;


}