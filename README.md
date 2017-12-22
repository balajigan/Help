# Help
## Install JDK

sudo apt-get install -y openjdk-8-jdk

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/

export PATH=$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin

## Install Maven
sudo apt-get install -y maven

## Create Maven project

mvn archetype:generate -DgroupId=com.batria -DartifactId=HzServer -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false


## jMeter related commands

mkdir /opt/jmeter

cd /opt/jmeter

curl -O http://apache.spinellicreations.com//jmeter/binaries/apache-jmeter-3.3.tgz

tar -xvzf apache-jmeter-3.3.tgz

### create Sample.jmx file through Jmeter GUI and take it to linux machine.

/opt/jmeter/apache-jmeter-3.3/bin/jmeter -n -t /opt/jmeter/Sample.jmx -l /opt/jmeter/testresults.jtl

### take the testresults.jtl back jmeter GUI.



