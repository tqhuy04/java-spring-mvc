package com.example.Hoc_Java_mua_xuan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class HocJavaMuaXuanApplication {

	public static void main(String[] args) {
		SpringApplication.run(HocJavaMuaXuanApplication.class, args);
	}
	@Bean
    public HiddenHttpMethodFilter hiddenHttpMethodFilter() {
        return new HiddenHttpMethodFilter();
    }
}
