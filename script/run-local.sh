#! /bin/sh

echo "# Eureka-Server run..."
java -jar ./Spring-Eureka/eureka-server/build/libs/eureka-server-0.0.1-SNAPSHOT.jar --spring.profiles.active=local >/dev/null 2>&1 &
sleep 5s

echo "# Netty-Server run..."
java -jar ./Netty-Telnet/netty-server/build/libs/tcp-server-0.0.1-SNAPSHOT.jar --spring.profiles.active=local >/dev/null 2>&1 &
sleep 5s

echo "# Eureka-Gateway run..."
java -jar ./Spring-Eureka/spring-cloud-gateway/build/libs/spring-cloud-gateway-0.0.1-SNAPSHOT.jar --spring.profiles.active=local >/dev/null 2>&1 &
sleep 3s

echo "# Eureka-Client1 run..."
java -jar ./Spring-Eureka/eureka-client/build/libs/eureka-client-0.0.1-SNAPSHOT.jar --spring.profiles.active=local >/dev/null 2>&1 &
sleep 3s

echo "# Eureka-Client2 run..."
java -jar ./Spring-Eureka/eureka-client-2nd/build/libs/eureka-client-2nd-0.0.1-SNAPSHOT.jar --spring.profiles.active=local >/dev/null 2>&1 &
sleep 3s

echo "# Netty-Client run..."
java -jar ./Netty-Telnet/netty-client/build/libs/tcp-client-0.0.1-SNAPSHOT.jar --spring.profiles.active=local >/dev/null 2>&1 &
