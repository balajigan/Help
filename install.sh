#!/bin/bash

sudo apt-get update
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin
sudo apt-get install -y git-core
sudo apt-get install -y maven

IP_ADDRESS="$(ifconfig | grep broadcast | awk '{print $2}')"
if [ -z "$IP_ADDRESS"]; then
      IP_ADDRESS="$(ifconfig | grep Bcast | awk '{print $2}' | awk -F: '{print $2}')"
fi

#echo "IP Address = $IP_ADDRESS"
#echo "listen_address: $IP_ADDRESS" >> /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
#echo "rpc_address: $IP_ADDRESS" >> /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
#sed -i -e "s/listen_address: localhost/listen_address: $IP_ADDRESS/g" /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
#sed -i -e "s/rpc_address: localhost/rpc_address: $IP_ADDRESS/g" /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
case $1 in
   dse)
        echo "Installing DSE"
        mkdir /opt/dse
        cd /opt/dse
        curl -O -k https://storage.googleapis.com/test-bin-for-use/test-bin.tar.gz
        tar -xvzf test-bin.tar.gz
	curl https://raw.githubusercontent.com/balajigan/Help/master/templates/dse.yaml > /opt/dse/dse-5.1.5/resources/dse/conf/dse.yaml
        curl https://raw.githubusercontent.com/balajigan/Help/master/templates/cassandra.yaml > /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
        #sed 'listen_address: $IP_ADDRESS' /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
        sed -i -e "s/listen_address: localhost/listen_address: $IP_ADDRESS/g" /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml
        sed -i -e "s/rpc_address: localhost/rpc_address: $IP_ADDRESS/g" /opt/dse/dse-5.1.5/resources/cassandra/conf/cassandra.yaml

        echo "Update YAMLs and run command: dse-5.1.5/bin/dse cassandra -R &"
        ;;
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
        echo "Update the YAML file and run the command: apache-cassandra-3.11.1/bin/cassandra -R &"
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
    camunda)
        echo "Installing Camunda"
	mkdir /opt/camunda
	cd /opt/camunda
	curl -O -k https://camunda.org/release/camunda-bpm/wildfly10/7.8/camunda-bpm-wildfly10-7.8.0.tar.gz
	tar -xvzf camunda-bpm-wildfly10-7.8.0.tar.gz
	sed -i -e "s/jboss.bind.address.management:127.0.0.1/jboss.bind.address.management:$IP_ADDRESS/g" /opt/camunda/server/wildfly-10.1.0.Final/standalone/configuration/standalone.xml
	sed -i -e "s/jboss.bind.address:127.0.0.1/jboss.bind.address:$IP_ADDRESS/g" /opt/camunda/server/wildfly-10.1.0.Final/standalone/configuration/standalone.xml
	;;
     kafka)
        echo "Installing Zookeeper"
	mkdir /opt/zookeeper
	cd /opt/zookeeper
	curl -O http://www.gtlib.gatech.edu/pub/apache/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz
	tar -xvzf zookeeper-3.4.10.tar.gz
	cp /opt/zookeeper/zookeeper-3.4.10/conf/zoo_sample.cfg /opt/zookeeper/zookeeper-3.4.10/conf/zoo.cfg
        echo "Installing Kafka"
	mkdir /opt/kafka
	cd /opt/kafka
	curl -O http://apache.claz.org/kafka/1.0.0/kafka_2.12-1.0.0.tgz
	tar -xvzf kafka_2.12-1.0.0.tgz
	echo "Use this command for running the tests: /opt/zookeeper/zookeeper-3.4.10/bin/zkServer.sh start"
	echo "Use this command for running the tests: /opt/kafka/kafka_2.12-1.0.0/bin/kafka-server-start.sh /opt/kafka/kafka_2.12-1.0.0/config/server.properties &"
	#/opt/kafka/kafka_2.12-1.0.0/bin/kafka-topics.sh --create --topic test-topic --zookeeper localhost:2181 --partitions 3 --replication-factor 1
	;;
   spark)
        echo "Installing Spark"
	mkdir /opt/spark
	cd /opt/spark
	curl -O http://apache.claz.org/spark/spark-2.2.1/spark-2.2.1-bin-hadoop2.7.tgz
	tar -xvzf spark-2.2.1-bin-hadoop2.7.tgz
	;;
    elastic)
        echo "Installing Elasticsearch"
	mkdir /opt/elastic
	cd /opt/elastic
	wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.2.deb
	sudo dpkg -i elasticsearch-6.2.2.deb
	echo "Use this command:  service elasticsearch start"
	;;
     kibana)
        echo "Installing kibana"
	mkdir /opt/kibana
	cd /opt/kibana
	wget https://artifacts.elastic.co/downloads/kibana/kibana-6.2.2-amd64.deb
	sudo dpkg -i kibana-6.2.2-amd64.deb
	sed -i -e "s/#server.host: localhost/server.host: $IP_ADDRESS/g" /etc/kibana/kibana.yml
	echo "Use this command:  service kibana start"
	;;
     prometheus)
        echo "Installing prometheus"
	mkdir /opt/prometheus
	cd /opt/prometheus
	wget https://github.com/prometheus/prometheus/releases/download/v2.2.0-rc.1/prometheus-2.2.0-rc.1.linux-amd64.tar.gz
	tar -xvzf prometheus-2.2.0-rc.1.linux-amd64.tar.gz
	wget https://github.com/prometheus/alertmanager/releases/download/v0.15.0-rc.0/alertmanager-0.15.0-rc.0.linux-amd64.tar.gz
	tar -xvzf alertmanager-0.15.0-rc.0.linux-amd64.tar.gz
	cd prometheus-2.2.0-rc.1.linux-amd64
	echo 'Use this command: ./prometheus --config.file=prometheus.yml --web.listen-address="$IP_ADDRESS:80"'
	
   *)
        echo "Unknown"
        ;;
   esac
   
