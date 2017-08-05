package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class Item extends BaseModel{

    private static final long serialVersionUID = -6054725352285143078L;
    private String title;

    private String sellPoint;

    private Long price;

    private Integer num;

    private String barcode;

    private String image;

    private Long cid;

    private Byte status;


}