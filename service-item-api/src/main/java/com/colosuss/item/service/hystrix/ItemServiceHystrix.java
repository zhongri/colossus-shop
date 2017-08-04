package com.colosuss.item.service.hystrix;

import com.colosuss.item.service.ItemService;
import com.colosuss.model.TbItem;
import com.colosuss.model.TbItemDesc;
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
    public TbItem getItemById(Long itemId) {
        return null;
    }

    @Override
    public TbItemDesc getItemDescById(Long itemId) {
        return null;
    }
}
