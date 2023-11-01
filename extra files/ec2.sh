#!/bin/bash
sudo apt update -y
#install java and maven
sudo apt install default-jdk maven git lynx -y

#Install Docker
#add docker official gpg key
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

#add the repository to apt sources
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker ubuntu
sudo systemctl restart docker

git clone -b master https://gitlab.com/odharmapuri1/felix-app2.git
sudo mv felix-app2/* .
sudo mvn clean install
sudo chmod u+x dockerbuild.sh
sudo chmod u+x dockertag.sh
./dockerbuild.sh
./dockertag.sh
#sudo docker build -t felix-app -f dockerapp .
#sudo docker build -t felix-db -f dockerdb .
#sudo docker build -t felix-web -f dockerweb .
#sudo docker pull rabbitmq
#sudo docker pull memcached
sudo docker compose up -d
sudo docker ps