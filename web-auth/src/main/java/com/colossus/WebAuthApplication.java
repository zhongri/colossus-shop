package com.colossus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;


@SpringBootApplication(exclude = RabbitAutoConfiguration.class)
@EnableEurekaClient
@EnableFeignClients
//@EnableApolloConfig
@EnableHystrix
public class WebAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebAuthApplication.class, args);
	}

}
