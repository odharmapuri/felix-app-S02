#!/bin/bash
git clone -b master https://gitlab.com/odharmapuri1/felix-app2.git
mv felix-app2/* .
mvn clean install
docker build -t felix-app -f dockerapp .
docker build -t felix-db -f dockerdb .
docker build -t felix-web -f dockerweb .
docker pull rabbitmq
docker pull memcached
docker compose up -d