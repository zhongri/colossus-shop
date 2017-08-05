package com.colosuss.model;

import lombok.Data;

@Data
public class UserAddr extends BaseModel{
    private static final long serialVersionUID = -4404020534997682710L;
    private String addrId;

    private String userId;

    private String receiverName;

    private String receiverPhone;

    private String receiverMobile;

    private String receiverState;

    private String receiverCity;

    private String receiverDistrict;

    private String receiverAddress;

    private String receiverZip;


}