package com.colosuss.cart.service.hystrix;

import com.colosuss.cart.service.CartService;
import com.colosuss.model.CartInfo;
import com.colosuss.model.BaseResult;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 购物车服务 熔断处理
 *
 * @author xubin.
 * @create 2017-05-04 下午11:59
 */

@Component
public class CartServiceHystrix implements CartService {


    @Override
    public BaseResult addCart(Long pid, Integer pcount, String uuid) {
        return null;
    }

    @Override
    public List<CartInfo> getCartInfoListByCookiesId(String cookieUUID) {
        return null;
    }

    @Override
    public BaseResult decreOrIncre(Long pid, Integer pcount, Integer type, Integer index, String cookieUUID) {
        return null;
    }
}
