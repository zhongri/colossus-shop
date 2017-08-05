package com.colosuss.portal.service.hystrix;

import com.colosuss.model.Content;
import com.colosuss.portal.service.PortalContentService;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 首页 熔断处理
 *
 * @author xubin.
 * @create 2017-05-04
 */

@Component
public class PortalContentServiceHystrix implements PortalContentService {


    @Override
    public List<Content> getContentByCid(Long bigAdIndex) {
        return null;
    }
}
