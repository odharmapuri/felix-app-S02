#!/bin/bash
project="felix"
docker_repo="odharmapuri"
version = "v1"
docker tag ${project}-app ${docker_repo}/${project}-app:${version}
docker tag ${project}-db ${docker_repo}/${project}-db:${version}
docker tag ${project}-web ${docker_repo}/${project}-web:${version}
