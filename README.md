# Help
## Install JDK

sudo apt-get install -y openjdk-8-jdk

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin

## Install Maven
sudo apt-get install -y maven

## Create Maven project

mvn archetype:generate -DgroupId=com.batria -DartifactId=HzServer -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

## Create Maven Springboot project

mvn archetype:generate -B -DarchetypeGroupId=am.ik.archetype -DarchetypeArtifactId=spring-boot-blank-archetype -DarchetypeVersion=1.0.6 -DgroupId=com.poc -DartifactId=PCF-HelloWorld -Dversion=1.0.0

git remote add origin https://github.com/balajigan/PCF-HelloWorld.git

## jMeter related commands

mkdir /opt/jmeter

cd /opt/jmeter

curl -O http://apache.spinellicreations.com//jmeter/binaries/apache-jmeter-3.3.tgz

tar -xvzf apache-jmeter-3.3.tgz

### create Sample.jmx file through Jmeter GUI and take it to linux machine.

/opt/jmeter/apache-jmeter-3.3/bin/jmeter -n -t /opt/jmeter/Sample.jmx -l /opt/jmeter/testresults.jtl

### take the testresults.jtl back jmeter GUI.

## Getting IP address

ifconfig | grep broadcast | awk '{print $2}'

## Get the rew install file in the VMs

curl https://raw.githubusercontent.com/balajigan/Help/master/install.sh > install.sh

curl -O https://raw.githubusercontent.com/balajigan/Help/master/install.sh && chmod 777 install.sh




