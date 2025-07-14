package com.example.Hoc_Java_mua_xuan.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;

@Configuration
public class securityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable() // Tắt CSRF để không chặn form POST
            .authorizeHttpRequests(auth -> auth
                .anyRequest().permitAll() // Cho phép tất cả request
            );
        return http.build();
    }
}
