package com.colosuss.model;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Data
public class TransactionMessage extends BaseModel {

    private static final long serialVersionUID = 8773441116136609868L;
    private Integer version;

    private String editor;

    private String creater;

    private Date editTime;

    private String messageId;

    private String messageDataType;

    private String consumerQueue;

    @Setter(value = AccessLevel.PRIVATE)
    @Getter(value = AccessLevel.PRIVATE)
    private Short messageSendTimes;

    private String areadlyDead;

    private String status;

    private String remark;

    private String field1;

    private String field2;

    private String field3;

    private String messageBody;


    public void addSendTimes() {
        messageSendTimes++;
    }
}