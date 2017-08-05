package com.colosuss.admin.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.colosuss.service.StorageFactory;

@Configuration
public class Config {

	@Bean
	public StorageFactory storageFactory(){
		return new StorageFactory();
	}
}
