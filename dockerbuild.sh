#!/bin/bash
docker build -t ${project}-app -f dockerapp .
docker build -t ${project}-db -f dockerdb .
docker build -t ${project}-web -f dockerweb .
docker pull rabbitmq
docker pull memcached