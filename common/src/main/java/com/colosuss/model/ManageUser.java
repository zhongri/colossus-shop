package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class ManageUser {
    private Long id;

    private String username;

    private String name;

    private String password;

    private String phone;

    private String email;

    private String job;

    private Date created;

    private Date updated;

}