package com.colossus.common.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class ItemParam extends BaseModel {

    private static final long serialVersionUID = -6567240704100775385L;
    /**
     * 商品类目ID
     *
     * @mbg.generated
     */
    private Long itemCatId;

    /**
     * 参数数据，格式为json格式
     *
     * @mbg.generated
     */
    private String paramData;


}