package com.colossus.cart;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;


@SpringBootApplication(exclude = RabbitAutoConfiguration.class,scanBasePackages ={"com.colossus"})
@EnableEurekaClient
@EnableFeignClients(basePackages ={"com.colossus.cart.service","com.colossus.redis.service"})
@EnableHystrix
//@EnableApolloConfig
public class WebCartApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebCartApplication.class, args);
	}

}
