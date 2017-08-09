package com.colossus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;
import zipkin.server.EnableZipkinServer;

@SpringBootApplication(exclude = RabbitAutoConfiguration.class)
@EnableZipkinServer
public class SleuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(SleuthApplication.class, args);
	}
}
