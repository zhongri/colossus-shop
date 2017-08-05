package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class ItemParamItem {
    private Long id;

    private Long itemId;

    private Date created;

    private Date updated;

    private String paramData;

}