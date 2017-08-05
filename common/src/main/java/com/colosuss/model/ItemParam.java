package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class ItemParam extends BaseModel {

    private static final long serialVersionUID = 5284940220274296401L;
    private Long itemCatId;

    private String paramData;

}