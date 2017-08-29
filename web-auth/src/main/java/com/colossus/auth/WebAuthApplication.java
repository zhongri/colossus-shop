package com.colossus.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;


@SpringBootApplication(exclude = RabbitAutoConfiguration.class,scanBasePackages ={"com.colossus"})
@EnableEurekaClient
@EnableFeignClients(basePackages = {"com.colossus.auth.service","com.colossus.redis.service","com.colossus.notify.service"})
//@EnableApolloConfig
@EnableHystrix
public class WebAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebAuthApplication.class, args);
	}

}
