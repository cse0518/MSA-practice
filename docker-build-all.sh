#! /bin/sh

eureka_dir="C:/Users/USER/Desktop/spring eureka"
netty_dir="C:/Users/USER/Desktop/Netty-Telnet"
username="cse0518"
version="ver_1"

echo "# Move to eureka directory"
cd ${eureka_dir}

echo "# Eureka-Server Docker Image Build..."
cd ./eureka-server
docker build --no-cache -t ${username}/eureka-server:${version} .
echo "# Docker Build Success ------------------------------------------"

echo "# Eureka-Gateway Docker Image Build..."
cd ../spring-cloud-gateway
docker build --no-cache -t ${username}/eureka-gateway:${version} .
echo "# Docker Build Success ------------------------------------------"

echo "# Eureka-Client1 Docker Image Build..."
cd ../eureka-client
docker build --no-cache -t ${username}/eureka-client1:${version} .
echo "# Docker Build Success ------------------------------------------"

echo "# Eureka-Client2 Docker Image Build..."
cd ../eureka-client-2nd
docker build --no-cache -t ${username}/eureka-client2:${version} .
echo "# Docker Build Success ------------------------------------------"

echo "# Move to netty directory"
cd ${netty_dir}

echo "# Telnet-Server Docker Image Build..."
cd ./telnet-server
docker build --no-cache -t ${username}/netty-server:${version} .
echo "# Docker Build Success ------------------------------------------"

echo "# Telnet-Client Docker Image Build..."
cd ./telnet-client
docker build --no-cache -t ${username}/netty-client:${version} .
echo "# Docker Build Success ------------------------------------------"
