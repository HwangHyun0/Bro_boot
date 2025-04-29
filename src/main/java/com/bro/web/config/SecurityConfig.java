package com.bro.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/admin/**").authenticated() // /admin/** 는 인증 필요
                .anyRequest().permitAll()                     // 나머지는 다 허용
            )
            .formLogin(form -> form
                .loginPage("/login/login.do")   // 로그인 페이지 경로 설정
                .permitAll()                    // 로그인 페이지는 누구나 접근 가능
            )
            .csrf(csrf -> csrf.disable())        // CSRF 끄기
            .httpBasic(httpBasic -> httpBasic.disable()); // HTTP 기본 인증 끄기
        return http.build();
    }
}
