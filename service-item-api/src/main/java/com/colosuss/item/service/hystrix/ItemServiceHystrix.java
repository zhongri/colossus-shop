package com.colosuss.item.service.hystrix;

import com.colosuss.item.service.ItemService;
import com.colosuss.model.Item;
import com.colosuss.model.ItemDesc;
import org.springframework.stereotype.Component;

/**
 * 商品服务 熔断处理
 *
 * @author xubin.
 * @create 2017-05-04
 */

@Component
public class ItemServiceHystrix implements ItemService {

    @Override
    public Item getItemById(Long itemId) {
        return null;
    }

    @Override
    public ItemDesc getItemDescById(Long itemId) {
        return null;
    }
}