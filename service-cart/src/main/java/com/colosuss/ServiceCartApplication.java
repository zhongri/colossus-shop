package com.colosuss;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableHystrix
@Configuration
@SpringBootApplication
@EnableDiscoveryClient
//@EnableApolloConfig
@EnableTransactionManagement
@MapperScan(basePackages = "cn.binux.mapper")
public class ServiceCartApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceCartApplication.class, args);
	}

}
