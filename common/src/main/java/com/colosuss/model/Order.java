package com.colosuss.model;

import lombok.Data;

import java.util.Date;

@Data
public class Order extends BaseModel {
    private static final long serialVersionUID = 8920730126737108046L;
    private String orderId;

    private String userId;

    private String addrId;

    private String payment;

    private Integer paymentType;

    private String postFee;

    private Integer status;

    private String shippingName;

    private String shippingCode;

    private String noAnnoyance;

    private String servicePrice;

    private String returnPrice;

    private String totalWeight;

    private Integer buyerRate;

    private Date closeTime;

    private Date endTime;

    private Date paymentTime;

    private Date consignTime;


}