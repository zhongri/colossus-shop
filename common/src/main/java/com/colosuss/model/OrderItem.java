package com.colosuss.model;

import lombok.Data;

@Data
public class OrderItem {
    private String id;

    private String itemId;

    private String orderId;

    private Integer num;

    private String title;

    private Long price;

    private Long totalFee;

    private String picPath;

    private String weights;

}