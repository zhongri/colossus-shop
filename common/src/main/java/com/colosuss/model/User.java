package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class User extends BaseModel {

    private static final long serialVersionUID = -5924747963109643500L;
    private String username;

    private String password;

    private String phone;

    private String email;


}