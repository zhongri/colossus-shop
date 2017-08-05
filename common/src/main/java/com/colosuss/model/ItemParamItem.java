package com.colosuss.model;

import lombok.Data;

@Data
public class ItemParamItem extends BaseModel{


    private static final long serialVersionUID = 5748838742955440687L;
    private Long itemId;

    private String paramData;

}