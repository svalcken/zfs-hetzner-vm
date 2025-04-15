#! /bin/bash

echo Update System
sudo apt update && apt upgrade -y && apt autoremove -y

echo Install needed Basic Tools
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

echo Get GPG Key for Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

echo Add Repository for Docker
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo Update System
sudo apt update && apt upgrade -y && apt autoremove -y

echo Remove old Docker Packages
sudo apt-get purge -y docker-engine docker docker.io docker-ce  
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce  
sudo umount /var/lib/docker/
sudo rm -rf /var/lib/docker /etc/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo rm -rf /usr/bin/docker-compose

echo Install Docker Packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo Docker Version:
sudo docker --version

echo Enable Docker Service:
sudo systemctl enable docker

echo Status Docker Service:
sudo systemctl status docker

echo Additional Tools:
sudo apt install -y multitail galances
