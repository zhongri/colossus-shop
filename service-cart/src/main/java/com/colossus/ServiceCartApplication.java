package com.colossus;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableHystrix
@SpringBootApplication(exclude = RabbitAutoConfiguration.class)
@EnableDiscoveryClient
//@EnableApolloConfig
@EnableTransactionManagement
@MapperScan(basePackages = "com.colossus.common.dao")
public class ServiceCartApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceCartApplication.class, args);
	}

}
