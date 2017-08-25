package com.colossus.common.model;

import lombok.Data;

@Data
public class AuthFilter extends BaseModel {
    private static final long serialVersionUID = -412612579529902964L;

    private String url;

    private String filter;
}