package com.colossus.cart.controller;

import com.colossus.RedisService;
import com.colossus.cart.service.CartService;
import com.colossus.common.utils.AppConfig;
import com.colossus.common.model.CartInfo;
import com.colossus.common.model.User;
import com.colossus.common.model.BaseResult;
import com.colossus.common.utils.CookieUtils;
import com.colossus.common.utils.FastJsonConvert;
import io.swagger.annotations.Api;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * 购物车 Controller
 *
 * @author xubin.
 * @create 2017-05-05
 */

@Api(value = "API - CartController", description = "购物车 Controller")
@Controller
@RefreshScope
public class CartController {

    private static final Logger logger = LoggerFactory.getLogger(CartController.class);

    @Autowired
    private CartService cartService;

    @Autowired
    private RedisService redisService;

    @Value("${redisKey.prefix.user_session}")
    private String USER_SESSION;

    @RequestMapping("/cart")
    public String showCart( HttpServletRequest request, HttpServletResponse response,Model model) {

        String cookieUUID = CookieUtils.getCookieValue(request, AppConfig.CART_KEY);
        String tokenLogin = CookieUtils.getCookieValue(request, AppConfig.TOKEN_LOGIN);

        User user = null;
        String userJson = null;
        if (StringUtils.isNoneEmpty(tokenLogin)) {

            try {
                userJson = redisService.get(USER_SESSION + tokenLogin);
            } catch (Exception e) {
                logger.error("Redis error", e);
            }

            if (StringUtils.isNoneEmpty(userJson)) {
                user = FastJsonConvert.convertJSONToObject(userJson, User.class);
            }
            model.addAttribute("user", user);
        } else {
            model.addAttribute("user", user);
        }

        List<CartInfo> cartInfos = new ArrayList<>();
        if (StringUtils.isNoneEmpty(cookieUUID)) {
            cartInfos= cartService.getCartInfoListByCookiesId(cookieUUID);
        }

        if (cartInfos.size() == 0) {
            model.addAttribute("cartInfos", null);
            return "cart";
        }

        int totalPrice = 0;

        for (int i = 0; i < cartInfos.size(); i++) {
            CartInfo cartInfo = cartInfos.get(i);
            totalPrice += cartInfo.getSum();
        }

        model.addAttribute("cartInfos", cartInfos);
        model.addAttribute("totalPrice", totalPrice);

        return "cart";
    }

    @RequestMapping("/showError")
    public String showError() {

        return "error";
    }

    /**
     * 模拟数据
     * @param callback
     * @return
     */
    @RequestMapping("/cart/miniCartServiceNew")
    public @ResponseBody String miniCartServiceNew(String callback) {

        String  s = "{\"Cart\":{\"TheSkus\":[],\"TheGifts\":[],\"TheSuit\":[],\"ManJian\":[],\"ManZeng\":[{\"Id\":196031044\n" +
                ",\"ManFlag\":true,\"ManNum\":0,\"ManPrice\":45.00,\"Num\":1,\"AddMoney\":45.00,\"SuitType\":11,\"PromotionPrice\":16297\n" +
                ".00,\"ManGifts\":[],\"Skus\":[{\"Id\":3133817,\"Name\":\"Apple\\ iPhone\\ 7\\ (A1660)\\ 32G\\ \\u9ED1\\u8272\\ \\u79FB\n" +
                "\\u52A8\\u8054\\u901A\\u7535\\u4FE14G\\u624B\\u673A\",\"Num\":2,\"ImgUrl\":\"jfs/t3298/58/1622979569/120892/64989235\n" +
                "/57d0d400Nfd249af4.jpg\",\"PromotionPrice\":5199.00,\"Gifts\":[],\"CouponAD\":[],\"Score\":0,\"FanPrice\":\"0.00\"\n" +
                ",\"CheckType\":\"1\",\"Cid\":\"655\",\"VenderId\":\"\"},{\"Id\":3133827,\"Name\":\"Apple\\ iPhone\\ 7\\ (A1660)\\ 128G\\ \\u9ED1\n" +
                "\\u8272\\ \\u79FB\\u52A8\\u8054\\u901A\\u7535\\u4FE14G\\u624B\\u673A\",\"Num\":1,\"ImgUrl\":\"jfs/t3298/58/1622979569\n" +
                "/120892/64989235/57d0d400Nfd249af4.jpg\",\"PromotionPrice\":5899.00,\"Gifts\":[],\"CouponAD\":[],\"Score\":0,\"FanPrice\"\n" +
                ":\"0.00\",\"CheckType\":\"1\",\"Cid\":\"655\",\"VenderId\":\"\"}]}],\"TotalPromotionPrice\":16297.00,\"Num\":3}}";
        return callback+"("+s+")";

    }

    @RequestMapping("/add")
    public String addCart(String  pid, Integer pcount, HttpServletRequest request, HttpServletResponse response, Model model) {
        String cookieUUID = CookieUtils.getCookieValue(request, AppConfig.CART_KEY);
        if (StringUtils.isBlank(cookieUUID)) {

            String uuid = UUID.randomUUID().toString().replaceAll("-", "");

            CookieUtils.setCookie(request, response, AppConfig.CART_KEY, uuid);

            BaseResult result = cartService.addCart(pid, pcount, uuid);

            model.addAttribute("cartInfo", result.getData());

            return "success";

        } else {
            BaseResult result = cartService.addCart(pid, pcount, cookieUUID);

            model.addAttribute("cartInfo", result.getData());

            return "success";
        }


    }

    /**
     * 根据商品id和数量对购物车增加商品或减少商品
     *
     * @param pid       商品id
     * @param pcount    增加数量
     * @param type      1 增加 2 减少
     * @param index     商品位置   ps:用于直接定位商品 不用遍历整个购物车
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/decreOrIncre")
    public @ResponseBody
    BaseResult decreOrIncre(Long pid, Integer pcount, Integer type, Integer index, HttpServletRequest request, HttpServletResponse response, Model model) {
        String cookieUUID = CookieUtils.getCookieValue(request, AppConfig.CART_KEY);
        if (StringUtils.isBlank(cookieUUID)) {

            model.addAttribute("msg","没有此Cookie!");

            return BaseResult.build(400,"请先去购物!");

        } else {
            return cartService.decreOrIncre(pid, pcount,type,index, cookieUUID);

        }


    }

}
