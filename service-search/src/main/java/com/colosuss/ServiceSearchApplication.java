package com.colosuss;

import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.xpack.client.PreBuiltXPackTransportClient;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.net.InetAddress;
import java.net.UnknownHostException;

@EnableHystrix
@Configuration
//@EnableApolloConfig
@SpringBootApplication
@EnableDiscoveryClient
@MapperScan(basePackages = {"cn.binux.search.mapper","cn.binux.mapper"})
public class ServiceSearchApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceSearchApplication.class, args);

	}
	@Bean
	public TransportClient elasticsearchClient() throws UnknownHostException {
		TransportClient client = new PreBuiltXPackTransportClient(Settings.builder()
				.put("client.transport.nodes_sampler_interval", "5s")
				.put("client.transport.sniff", false)
				.put("transport.tcp.compress", true)
				.put("request.headers.X-Found-Cluster", "elasticsearch")
				.put("xpack.security.transport.ssl.enabled", false)
				.put("cluster.name", "elasticsearch")
				.put("xpack.security.user", "liusy:417937")
				.build())
				.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("192.168.0.50"),9300))
				.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("192.168.0.51"),9300))
				.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName("192.168.0.52"),9300));
		return client;
	}
}
