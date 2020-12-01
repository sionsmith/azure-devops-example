#!/usr/bin/env bash

# Start logging
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/log/user-data-log.log 2>&1

# Update all packages repository.
sudo apt-get update -y
sudo apt update

# Update ubuntu mirrors
sudo apt install software-properties-common

# Install Python PiP3.
sudo apt install python3-pip -y
sudo -H pip3 install --upgrade pip
pip install --user boto3 botocore

# Add ubuntu mirror
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install ansible
sudo apt-get install ansible git vim -y

#install docker and docker compose
apt install docker.io -y
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#pull down example repo from github to test Confluent Platform
cd /home
git clone https://github.com/vdesabou/kafka-docker-playground.git
cd ./kafka-docker-playground/environment/plaintext
./start.sh