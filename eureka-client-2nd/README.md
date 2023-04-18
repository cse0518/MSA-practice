# Spring Eureka Client

Spring Cloud Gateway - Eureka Client 구현

<br/>

## Eureka Client Settings

- 처음 spring initialization 할 때 설정을 해줘야 에러가 나지 않음.
- `Spring Web`, `Eureka Discovery Client` dependencies 추가

<br/>

- main 클래스에 `@EnableDiscoveryClient` 추가
  ```java
  @SpringBootApplication
  @EnableDiscoveryClient
  public class DiscoveryApplication {
      public static void main(String[] args) {
          SpringApplication.run(DiscoveryApplication.class, args);
      }
  }
  ```
  
- property 설정 (application.yml)
  ```yaml
  spring:
    application:
      name: eureka-client-2nd

  server:
    port: 8082
  
  eureka:
    client:
      service-url:
        defaultZone: http://localhost:8761/eureka # Eureka Server
  ```

- 간단한 Rest Controller 구현
  ```java
  @RestController
  @RequestMapping("/client2")
  public class EurekaRestController {
  
      @Value("${server.port}")
      private String port;
  
      @GetMapping("/test")
      public ResponseEntity<String> getStatus() {
          return ResponseEntity.ok("Client2 server is running on port : " + port);
      }
  }
  ```
