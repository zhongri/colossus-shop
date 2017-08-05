package com.colosuss.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Category implements Serializable {
    private String id;

    private String name;

    private Integer sortOrder;

    private Date created;

    private Date updated;

}