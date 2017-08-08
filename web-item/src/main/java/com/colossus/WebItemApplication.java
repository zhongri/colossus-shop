package com.colossus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.Configuration;


@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
@EnableHystrix
@Configuration
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class, RabbitAutoConfiguration.class})
//@EnableApolloConfig
public class WebItemApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebItemApplication.class, args);
	}
}
