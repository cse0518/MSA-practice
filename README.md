## 실행

- 실행 환경
  - Gradle 7.6.1
  - Docker 20.10.24

- 실행
  ```shell
  # submodules 포함하여 clone (--recursive 옵션)
  git clone --recursive https://github.com/cse0518/MSA-practice.git
  
  # 스크립트 실행 (gradle build → docker image build → docker-compose up)
  ./run.sh
  
  # docker-compose container 내리고 삭제
  docker-compose -f docker/docker-compose.yml -p msa-project down
  ```

<br/>

## Index

- [프로젝트 소개](#-프로젝트-소개)
- [기술 스택](#-기술-스택)
- [주요 내용](#-주요-내용)
  - [1. 대규모 트래픽 처리를 위한 비동기 처리](#1-대규모-트래픽-처리를-위한-비동기-처리)
  - [2. 마이크로 서비스들을 관제하기 위해 Spring Eureka 적용](#2-마이크로-서비스들을-관제하기-위해-spring-eureka-적용)

<br/>

## 📑 프로젝트 소개

![all-structure](https://github.com/cse0518/MSA/assets/60170616/4e8cbd89-4c56-48e8-a8b0-bc904e7ca52a)

- 마이크로서비스 구조에 **Spring Cloud Gataway**와 **Spring Eureka**를 적용하여 모든 서비스에 대한 인증 및 로드밸런싱을 구현합니다.
- Eureka Client에서는 WebFlux를 활용하여 비동기적으로 HTTP 요청을 처리합니다.
- 데이터를 **Kafka**에 Publish, Subscribe 하는 로직을 구현합니다.
- **Socket 통신**으로 데이터 전송 로직을 구현합니다.

<br/>

## 🛠 기술 스택

- Java 8, Spring Boot 2.7.10
- Webflux, Netty
- Spring Eureka, Spring Cloud Gateway
- Zookeeper 3.4.13, Kafka 3.4.0
- Docker 20.10.24

<br/>

## 📌 주요 내용

<img src="https://user-images.githubusercontent.com/60170616/232970280-115d2eb9-b1af-4fea-9c11-95817cca5a6c.png" alt="https://user-images.githubusercontent.com/60170616/232970280-115d2eb9-b1af-4fea-9c11-95817cca5a6c.png" width="800"/>

### 1. 대규모 트래픽 처리를 위한 비동기 처리

- 많은 서비스에 대한 Client의 요청이 Gateway를 거쳐 각 서비스에 전달됩니다.
- Gateway에 집중되는 대규모 트래픽을 빠르게 처리하기 위해 WebFlux를 적용했습니다.  
  WebFlux는 비동기 Non-Blocking 방식으로 동작하여 적은 수의 스레드로 많은 요청을 처리할 수 있습니다.
- Spring-Cloud-Gateway는 MSA 구조에서 쉽고 빠르게 로드 밸런싱을 해줍니다.  
  Netty를 기반의 비동기 Non-Blocking 방식으로 동작하여 빠르게 일을 처리합니다.

<br/>

### 2. 마이크로 서비스들을 관제하기 위해 Spring Eureka 적용

- Eureka Server에서는 실행중인 서비스들의 호스트와 포트 정보를 등록하고 관리합니다.  
  마이크로 서비스들이 서로의 주소를 확인하고 통신할 수 있도록 합니다.

<br/>

### 3. 비동기식으로 작업을 처리하기 위해 MQ(Kafka) 활용

- 각 모듈에서 비동기식으로 요청을 처리하기 위해 MQ(Kafka)를 사용했습니다.
- 동시에 처리되는 개수를 제어하고, 데이터 복원력 향상을 도모합니다.
- Kafka 환경을 모니터링 하기 위해 CMAK을 사용했습니다.
  - Kafka Cluster 및 Topic 등 관리
  - Kafka Lag 모니터링

<br/>

<img src="https://github.com/cse0518/MSA-practice/assets/60170616/d2cfe502-3ce4-4625-ad5c-8a8489bbcae7" alt="https://github.com/cse0518/MSA-practice/assets/60170616/d2cfe502-3ce4-4625-ad5c-8a8489bbcae7" width="700">

### 4. 적은 스레드로 많은 요청을 효율적으로 처리하기 위해 Netty 활용

- Kafka에서 consume 한 데이터를 비동기식으로 효율적으로 처리하기 위해 Netty를 사용했습니다.
