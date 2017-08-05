package com.colosuss.model;

import lombok.Data;

@Data
public class ManageUser extends BaseModel{

    private static final long serialVersionUID = -4098051476089779134L;
    private String username;

    private String name;

    private String password;

    private String phone;

    private String email;

    private String job;


}