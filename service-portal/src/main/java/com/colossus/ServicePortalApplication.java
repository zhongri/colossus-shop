package com.colossus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableHystrix
//@EnableApolloConfig
@SpringBootApplication(exclude = RabbitAutoConfiguration.class)
@EnableDiscoveryClient
@EnableTransactionManagement
@MapperScan(basePackages = "com.colossus.common.dao")
public class ServicePortalApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServicePortalApplication.class, args);
	}

}
