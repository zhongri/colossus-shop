package com.colossus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

@EnableHystrix
//@EnableApolloConfig
@SpringBootApplication(exclude = RabbitAutoConfiguration.class)
@EnableDiscoveryClient
public class ServiceNotifyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceNotifyApplication.class, args);
	}

}
