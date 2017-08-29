package com.colossus;

import com.colossus.redis.ServiceRedisApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest(classes = ServiceRedisApplication.class)
@RunWith(SpringRunner.class)
public class AutowiredTest {

    @Test
    public void test(){
        System.out.print("hahhahah");
    }

}
