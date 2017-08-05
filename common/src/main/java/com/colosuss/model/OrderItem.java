package com.colosuss.model;

import lombok.Data;

@Data
public class OrderItem extends BaseModel{


    private static final long serialVersionUID = -1808880204838279980L;
    private String itemId;

    private String orderId;

    private Integer num;

    private String title;

    private Long price;

    private Long totalFee;

    private String picPath;

    private String weights;

}