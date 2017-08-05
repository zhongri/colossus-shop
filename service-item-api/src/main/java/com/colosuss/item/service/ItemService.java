package com.colosuss.item.service;

import com.colosuss.item.service.hystrix.ItemServiceHystrix;
import com.colosuss.model.Item;
import com.colosuss.model.ItemDesc;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 商品 Service
 *
 * @author xubin.
 * @create 2017-05-04
 */

@FeignClient(value = "xbin-store-cloud-service-item",fallback = ItemServiceHystrix.class)
public interface ItemService {

    @RequestMapping(value = "/getItemById/{id}",method = RequestMethod.POST)
    Item getItemById(@PathVariable("id") Long itemId);

    @RequestMapping(value = "/getItemDescById/{id}",method = RequestMethod.POST)
    ItemDesc getItemDescById(@PathVariable("id") Long itemId);


}
