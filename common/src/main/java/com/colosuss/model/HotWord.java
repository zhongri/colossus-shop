package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class HotWord extends BaseModel{


    private static final long serialVersionUID = -3894156191979865672L;
    private String category;

    private String name;

    private String url;

    private Byte search;


}