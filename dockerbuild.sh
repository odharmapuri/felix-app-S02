#!/bin/bash

docker build -t felix-app -f dockerapp .
docker build -t felix-db -f dockerdb .
docker build -t felix-web -f dockerweb .