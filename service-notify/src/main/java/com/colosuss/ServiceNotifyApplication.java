package com.colosuss;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.Configuration;

@EnableHystrix
@Configuration
//@EnableApolloConfig
@SpringBootApplication
@EnableDiscoveryClient
public class ServiceNotifyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceNotifyApplication.class, args);
	}

}
