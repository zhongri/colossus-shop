

## colossus-shop

模仿国内知名B2C网站,实现的一个分布式B2C商城

[参考项目github地址](https://github.com/xubinux/xbin-store-cloud)

### 涉及技术
* Spring Cloud Hystrix
* Spring Cloud Turbine
* Spring Cloud Eureka
* Spring Cloud Sleuth
* Spring Cloud Config
* Spring Cloud Feign
* Spring Cloud Zuul
* Spring Cloud Bus
* Spring Boot Admin
* Spring Boot
* RabbitMQ
* Swagger2
* Druid
* MyBatis
* MySQL
* Redis
* ElasticSearch
* MyBatis
* ZipKin
* Docker
* FastDFS
* Freemarker
* Beetl
* ...

### 端口规划(一台机器部署)

|Web应用名称|端口|
|:-:|:-:|
| Portal-Web  		|8101 |
| Search-Web 		|8102 |
| Item-Web    		|8103 |
| SSO-Web     		|8104 |
| Admin-Web   		|8105 |
| Cart-Web    		|8106 |
| Order-Web   		|8107 |
| Home-Web     		|8108 |
| Recommended-Web	|8109 |
| AD-Web    			|8110 |
| Ranking-Web     	|8111 |
| Mymoney-Web     	|8112 |
| Pay-Web     		|8113 |
| Baitiao-Web     	|8114 |
| Coupons-Web     	|8115 |
| Seckill-Web     	|8116 |
| CS-Web     		|8117 |
| API-Web    		|8118 |


| Service服务名称|端口|
|:-:|:-:|
| Admin-Service      	|8510 |
| Redis-Service(去除) 	|8511 |
| Search-Service     	|8512 |
| Portal-Service     	|8513 |
| Item-Service       	|8514 |
| SSO-Service        	|8515 |
| Notify-Service     	|8516 |
| Cart-Service       	|8517 |
| Order-Service      	|8518 |
| Home	-Service			|8519 |
| Recommended-Service	|8520 |
| AD-Service    		|8521 |
| Ranking-Service 	   |8522 |
| Mymoney-Service		|8523 |
| Pay-Service     		|8524 |
| Baitiao-Service		|8525 |
| Coupons-Service  	|8526 |
| Seckill-Service		|8527 |
| CS-Service     		|8528 |


|Cloud服务名称|端口1|端口2|端口3|
|:-:|:-:|:-:|:-:|
| Eureka      	 			|8501 |8601 |8701 |
| Config     				|8502 |8602 |8702 |
| apollo-portal				|8502 |
| zuul     	 	 			|8503 |8603 |8703 |
| Sleuth     	 			|8504 |
| Admin	     	 			|8505 |
| Turbine     	 			|8506 |
| apollo-configservice  	|8507 |
| apollo-adminservice   	|8508 |


### 实现目标

本项目最终实现的目标 [点我查看最后完成效果](https://www.jd.com)







