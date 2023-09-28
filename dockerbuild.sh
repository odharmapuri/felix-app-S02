#!/bin/bash
#git clone -b master https://gitlab.com/odharmapuri1/felix-app2.git
#mv felix-app2/* .
#mvn clean install
docker build -t ${project}-app -f dockerapp .
docker build -t ${project}-db -f dockerdb .
docker build -t ${project}-web -f dockerweb .
docker pull rabbitmq
docker pull memcached
#docker compose up -d