package com.humuson.eurekaclient.controller;

import com.humuson.eurekaclient.dto.TestDto;
import com.humuson.eurekaclient.producer.Producer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/client")
public class EurekaRestController {

    @Value("${server.port}")
    private String port;

    private final Producer producer;

    public EurekaRestController(Producer producer) {
        this.producer = producer;
    }

    @GetMapping("/test")
    public ResponseEntity<String> getStatus() {
        return ResponseEntity.ok("Client server is running on port : " + port);
    }

    @PostMapping("/{orderId}")
    public ResponseEntity<Void> buyItem(
            @PathVariable Long orderId,
            @RequestBody TestDto testDto
    ) {
        testDto.setOrderId(orderId.intValue());
        String message = testDto.toString();
        producer.publish(message);
        return ResponseEntity.ok().build();
    }
}
