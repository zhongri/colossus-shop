package cn.binux.service;


import cn.binux.service.histrix.RedisServiceHistrix;
import org.springframework.cloud.netflix.feign.FeignClient;

@FeignClient(value = "xbin-store-service-redis",fallback = RedisServiceHistrix.class)
public interface RedisService {
}
