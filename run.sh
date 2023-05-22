#! /bin/sh

echo "##### docker-compose up #####"
docker-compose -f docker/docker-compose.yml -p msa-project up -d
sleep 1s

echo "##### zookeeper-add-znodes #####"
./script/zookeeper-add-znodes.sh
