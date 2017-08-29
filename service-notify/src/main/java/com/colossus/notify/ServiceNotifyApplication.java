package com.colossus.notify;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

@EnableHystrix
//@EnableApolloConfig
@SpringBootApplication(exclude = RabbitAutoConfiguration.class,scanBasePackages ={"com.colossus"})
@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"com.colossus.notify.service","com.colossus.redis.service"})
@EnableEurekaClient
public class ServiceNotifyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceNotifyApplication.class, args);
	}

}
