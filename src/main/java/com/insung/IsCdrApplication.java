package com.insung;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class IsCdrApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(IsCdrApplication.class, args);
	} 
	
	//톰켓서버에 war를 배포하기 위해 추가해야하는 코드 
	@Override 
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) { 
		return builder.sources(IsCdrApplication.class); 
	}

}
   