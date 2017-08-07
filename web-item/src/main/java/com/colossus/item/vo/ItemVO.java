package com.colossus.item.vo;

import com.colossus.common.model.Item;
import org.apache.commons.lang3.StringUtils;

/**
 * Item 扩展pojo
 *
 * @author xubin.
 * @create 2017-02-06 下午3:12
 */


public class ItemVO extends Item {

    private static final long serialVersionUID = 8951590253173371314L;
    private String[] images;

    public ItemVO(Item item) {
        //初始化属性
        this.setId(item.getId());
        this.setTitle(item.getTitle());
        this.setSellPoint(item.getSellPoint());
        this.setPrice(item.getPrice());
        this.setNum(item.getNum());
        this.setBarcode(item.getBarcode());
        this.setImage(item.getImage());
        this.setCid(item.getCid());
        this.setStatus(item.getStatus());
        this.setCreateTime(item.getCreateTime());
        this.setUpdateTime(item.getUpdateTime());
    }

    public String[] getImages() {

        if (StringUtils.isNotBlank(this.getImage())) {

            String[] split = this.getImage().split(",");

            return split;
        } else {
            return null;
        }

    }

}
