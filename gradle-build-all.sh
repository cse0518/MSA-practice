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
cd ../eureka-client-2nd
./gradlew clean build

echo "# Move to netty directory"
cd ${netty_dir}

echo "# Netty-Server Gradle Build..."
cd ./netty-server
./gradlew clean build

echo "# Netty-Client Gradle Build..."
cd ../netty-client
./gradlew clean build
