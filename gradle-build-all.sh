#! /bin/sh

eureka_dir="C:/Users/USER/Desktop/spring eureka"
netty_dir="C:/Users/USER/Desktop/Netty-Telnet"

echo "# Move to eureka directory"
cd ${eureka_dir}

echo "# Eureka-Server Gradle Build..."
cd ./eureka-server
./gradlew clean build

echo "# Eureka-Gateway Gradle Build..."
cd ../spring-cloud-gateway
./gradlew clean build

echo "# Eureka-Client1 Gradle Build..."
cd ../eureka-client
./gradlew clean build

echo "# Eureka-Client2 Gradle Build..."
cd ../eureka-client2
./gradlew clean build

echo "# Move to netty directory"
cd ${netty_dir}

echo "# Telnet-Server Gradle Build..."
cd ./telnet-server
./gradlew clean build

echo "# Telnet-Client Gradle Build..."
cd ./telnet-client
./gradlew clean build
