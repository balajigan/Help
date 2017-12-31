#!/bin/bash
sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
sudo apt-get install -y git-core
sudo apt-get install -y maven



git clone https://github.com/balajigan/cache-rest-service.git
cd cache-rest-service/hazelcast-cache-service


case $1 in
   dse)
        echo "Install DSE"
        
   hz)
        echo "Installing Hz"
        git clone https://github.com/balajigan/Hazelcast.git
        cd Hazelcast
        ;;
   cassandra)
        echo "Install Cassandra"
        mkdir /opt/cassandra
        cd /opt/cassandra
        curl -O -k http://apache.claz.org/cassandra/3.11.1/apache-cassandra-3.11.1-bin.tar.gz
        tar -xvzf apache-cassandra-3.11.1-bin.tar.gz
        ;;
   api)
        echo "Installing api"
        git clone https://github.com/balajigan/cache-rest-service.git
        cd cache-rest-service
        ;;
   jm)
        echo "Installing jMeter"
        mkdir /opt/jmeter
        cd /opt/jmeter
        curl -O http://apache.spinellicreations.com//jmeter/binaries/apache-jmeter-3.3.tgz
        tar -xvzf apache-jmeter-3.3.tgz
        echo "Use this command for running the tests: /opt/jmeter/apache-jmeter-3.3/bin/jmeter -n -t /opt/jmeter/Sample.jmx -l /opt/jmeter/testresults.jtl"
        ;;
   *)
        echo "Unknown"
        ;;
   esac
   
