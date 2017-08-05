package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class ItemDesc extends BaseModel {
    private static final long serialVersionUID = 8328058395857771990L;
    private Long itemId;

    private String itemDesc;

}