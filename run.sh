#! /bin/sh

echo "##### gradle-build-all #####"
./script/gradle-build-all.sh
sleep 1s

echo "##### docker-image-build-all #####"
./script/docker-image-build-all.sh
sleep 1s

echo "##### docker-compose up #####"
docker-compose -f docker/docker-compose.yml -p msa-project up -d
sleep 1s

echo "##### zookeeper-add-znodes #####"
./script/zookeeper-add-znodes.sh
