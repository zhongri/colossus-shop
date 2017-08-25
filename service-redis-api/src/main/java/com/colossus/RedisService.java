package com.colossus;


import com.colossus.histrix.RedisServiceHistrix;
import org.springframework.cache.CacheManager;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Set;

@FeignClient(value = "service-redis",fallback = RedisServiceHistrix.class)
public interface RedisService {

    @GetMapping(value = "get")
    String get(String key);

    @PostMapping(value = "set")
    String set(String key, String value);

    @GetMapping(value = "hget")
    String hget(String hkey, String key);

    @PostMapping(value = "hset")
    long hset(String hkey, String key, String value);

    @PostMapping(value = "incr")
    long incr(String key);

    @PostMapping(value = "expire")
    long expire(String key, Integer second);

    @GetMapping(value = "ttl")
    long ttl(String key);

    @PostMapping(value = "del")
    long del(String key);

    @PostMapping(value = "hdel")
    long hdel(String hkey, String key);

    @GetMapping(value = "get-cacheManager")
    CacheManager getCacheManager();

    @GetMapping(value = "get-keys")
    Set<String> keys(String hkey);

    @GetMapping(value = "hlen")
    long hlen(String hkey);
}
