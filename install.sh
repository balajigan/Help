#!/bin/bash
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
sudo apt-get install -y git-core
sudo apt-get install -y maven
https://github.com/balajigan/cache-rest-service.git
cd cache-rest-service/hazelcast-cache-service

git clone https://github.com/balajigan/Hazelcast.git

