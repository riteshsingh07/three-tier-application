#!/bin/bash

# Update packages
apt-get update -y

# -----------------------------
# Install dependencies
# -----------------------------
apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    unzip


# For Ubuntu 22.04
# Intsalling Java
apt update -y
apt install -y openjdk-21-jdk
java -version

# Installing Jenkins
# curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
#   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
# echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#   https://pkg.jenkins.io/debian binary/ | sudo tee \
#   /etc/apt/sources.list.d/jenkins.list > /dev/null
# apt-get update -y
# apt-get install jenkins -y

# Installing Docker 
apt update
apt install docker.io -y
usermod -aG docker ubuntu

# Enable and start Docker
systemctl enable docker
systemctl start docker

# If you don't want to install Jenkins, you can create a container of Jenkins
# docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-container jenkins/jenkins:lts

# Run Docker Container of Sonarqube
docker run -itd  --name sonarqube -p 9000:9000 sonarqube:lts-community


# Installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install unzip -y
unzip awscliv2.zip
./aws/install

# # Installing Kubectl
# sudo apt update
# sudo apt install curl -y
# sudo curl -LO "https://dl.k8s.io/release/v1.28.4/bin/linux/amd64/kubectl"
# sudo chmod +x kubectl
# sudo mv kubectl /usr/local/bin/
# kubectl version --client


# # Installing eksctl
# curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# sudo mv /tmp/eksctl /usr/local/bin
# eksctl version

# Installing Trivy
apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
apt update
apt install trivy -y


# # Intalling Helm
# sudo snap install helm --classic