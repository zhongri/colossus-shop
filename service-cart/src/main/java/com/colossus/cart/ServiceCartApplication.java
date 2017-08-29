package com.colossus.cart;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableHystrix
@SpringBootApplication(exclude = RabbitAutoConfiguration.class,scanBasePackages ={"com.colossus"})
@EnableDiscoveryClient
//@EnableApolloConfig
@EnableTransactionManagement
@EnableEurekaClient
@EnableFeignClients(basePackages = {"com.colossus.redis.service"})
@MapperScan(basePackages = "com.colossus.common.dao")
public class ServiceCartApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceCartApplication.class, args);
	}

}
