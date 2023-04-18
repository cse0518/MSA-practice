package com.humuson.eurekaclient.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/client")
public class EurekaRestController {

    @Value("${server.port}")
    private String port;

    @GetMapping("/test")
    public ResponseEntity<String> getStatus() {
        return ResponseEntity.ok("Client server is running on port : " + port);
    }
}
