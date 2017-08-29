package com.colossus.item;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;


@SpringBootApplication(exclude={DataSourceAutoConfiguration.class, RabbitAutoConfiguration.class},scanBasePackages ={"com.colossus"})
@EnableEurekaClient
@EnableFeignClients(basePackages = {"com.colossus.item.service"})
@EnableHystrix
//@EnableApolloConfig
public class WebItemApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebItemApplication.class, args);
	}
}
