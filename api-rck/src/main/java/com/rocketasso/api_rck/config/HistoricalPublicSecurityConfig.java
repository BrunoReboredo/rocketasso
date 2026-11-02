package com.rocketasso.api_rck.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class HistoricalPublicSecurityConfig {
    @Bean
    @Order(1)
    SecurityFilterChain historicalPublicResources(HttpSecurity http) throws Exception {
        return http.securityMatcher("/logos/clubs/**", "/api/historicalclassification/**", "/api/hall-of-fame", "/api/hall-of-fame/**", "/api/noticias", "/api/noticias/**")
            .cors(cors -> {})
            .authorizeHttpRequests(auth -> auth
                .requestMatchers(HttpMethod.GET, "/logos/clubs/**", "/api/historicalclassification/**", "/api/hall-of-fame", "/api/hall-of-fame/**", "/api/noticias", "/api/noticias/**").permitAll()
                .anyRequest().denyAll())
            .build();
    }

    @Bean
    @Order(2)
    SecurityFilterChain remainingResources(HttpSecurity http) throws Exception {
        return http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated())
            .httpBasic(basic -> {}).build();
    }
}