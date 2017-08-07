package com.colossus.common.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Content extends BaseModel {

    private static final long serialVersionUID = 8131841250759129780L;
    private String categoryId;

    private String title;

    private String subTitle;

    private String url;

    private String pic;

    private String pic2;

    private String content;
}