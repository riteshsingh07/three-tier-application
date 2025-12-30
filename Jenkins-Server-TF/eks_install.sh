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
apt install openjdk-17-jre -y
apt install openjdk-17-jdk -y
java --version

# Installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
apt install unzip -y
unzip awscliv2.zip
./aws/install

# Installing kubectl
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client


# Installing eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

# Setup EKS Cluster
eksctl create cluster --name three-tier-cluster --region ap-south-1 --node-type m7i-flex.large --nodes-min 2 --nodes-max 3
aws eks update-kubeconfig --region ap-south-1 --name three-tier-cluster
kubectl get nodes