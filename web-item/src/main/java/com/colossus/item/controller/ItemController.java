package com.colossus.item.controller;

import com.colossus.item.service.ItemService;
import com.colossus.item.vo.ItemVO;
import com.colossus.common.model.ItemDesc;
import io.swagger.annotations.Api;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 商品查询 Controller
 *
 * @author xubin.
 * @create 2017-05-04
 */

@Api(value = "API - ItemController", description = "商品 Controller")
@Controller
public class ItemController {

    private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

    @Autowired
    private ItemService itemService;

    @RequestMapping(value = "/item/{id}",method = RequestMethod.GET)
    public String  getItemByItemId(@PathVariable("id") String  itemId, Model model) {

        ItemVO item = new ItemVO(itemService.getItemById(itemId));

        ItemDesc itemDesc = itemService.getItemDescById(itemId);

        model.addAttribute("item", item);
        model.addAttribute("itemDesc", itemDesc);

        return "item";
    }

}
