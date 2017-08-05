package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class HotWord {
    private Long id;

    private String category;

    private String name;

    private String url;

    private Byte search;

    private Date created;

    private Date updated;

}