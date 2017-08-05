package com.colosuss.model;

import lombok.Data;

@Data
public class Content extends BaseModel {

    private static final long serialVersionUID = -5828087660151423977L;
    private Long categoryId;

    private String title;

    private String subTitle;

    private String titleDesc;

    private String url;

    private String pic;

    private String pic2;


    private String content;

}