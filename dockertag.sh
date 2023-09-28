docker tag ${project}-app ${docker_repo}/${project}-app:${BUILD_NUMBER}
docker tag ${project}-db ${docker_repo}/${project}-db:${BUILD_NUMBER}
docker tag ${project}-web ${docker_repo}/${project}-web:${BUILD_NUMBER}

