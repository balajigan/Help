#!/bin/bash
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
sudo apt-get install -y git-core
sudo apt-get install -y maven
mkdir /opt/jmeter
cd /opt/jmeter
curl -O http://apache.spinellicreations.com//jmeter/binaries/apache-jmeter-3.3.tgz
tar -xvzf apache-jmeter-3.3.tgz


git clone https://github.com/balajigan/cache-rest-service.git
cd cache-rest-service/hazelcast-cache-service

git clone https://github.com/balajigan/Hazelcast.git
