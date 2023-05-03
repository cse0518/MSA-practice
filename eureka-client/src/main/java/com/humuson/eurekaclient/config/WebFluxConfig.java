package com.humuson.eurekaclient.config;

import com.humuson.eurekaclient.controller.TestRestController;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.config.EnableWebFlux;
import org.springframework.web.reactive.config.WebFluxConfigurer;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

@Slf4j
@EnableWebFlux
@Configuration
public class WebFluxConfig implements WebFluxConfigurer {

    @Bean
    public RouterFunction<ServerResponse> route(TestRestController controller) {
        return RouterFunctions.route()
                .GET("/service1/status", controller::getStatus)
                .POST("/service1/{userId}", RequestPredicates.accept(MediaType.APPLICATION_JSON), controller::order)
                .build();
    }
}
