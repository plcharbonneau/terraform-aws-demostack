#!/usr/bin/env bash
echo "==> Docker"

echo "--> Adding keyserver"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &>/dev/null

echo "--> Adding repo"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "--> Updating cache"
apt update -y

echo "--> Installing"
apt install -y docker-ce

echo "--> Allowing docker without sudo"
sudo usermod -aG docker "$(whoami)"

echo "==> Docker is done!"
