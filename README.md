# Spring Eureka 구현

MSA 기반의 api 서버를 구축하기 위해 spring eureka 기술을 사용했습니다.  
Spring Cloud Gateway - Eureka Server, Client를 구현했습니다.

Eureka는 클라우드 환경에서 다수의 서비스들의 로드 밸런싱 및 장애 조치 목적을 가진 미들웨어 서버입니다.  
MSA 환경에서 수많은 api 서버들로 구성이 될 것이고, 이 서버들을 하나의 게이트웨이를 통해서 관리합니다.

하나의 Eureka Server에서 여러개의 Eureka Client들을 관리합니다.

<br/>

## Eureka Server

- discovery server
- eureka server에 등록된 micro service 목록을 조회할 수 있다.  
  http://localhost:8761/eureka/apps

## Eureka Client

- Eureka Server와 통신하여 자신을 등록하고 서비스 정보를 보낸다.
- 서버로부터 데이터를 가져와 캐싱하고 주기적으로 변경사항을 확인한다.
