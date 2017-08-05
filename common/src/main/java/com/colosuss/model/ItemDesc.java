package com.colosuss.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ItemDesc implements Serializable {
    private Long itemId;

    private Date created;

    private Date updated;

    private String itemDesc;

}