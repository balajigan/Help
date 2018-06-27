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

## FLY CLI Commands

fly -t local login -c http://10.142.0.3:8080

fly -t local set-pipeline --pipeline MyPipeline --config pipeline.yml

## Install CF cli

wget https://packages.cloudfoundry.org/stable?release=debian64

cp stable\?release\=debian64.1 test.deb

sudo dpkg -i test.deb

cf login -a https://api.run.pivotal.io

## mounting the files in Linux VMs
### list the disks and partitions

sudo fdisk -l

### Partition the disk

sudo fdisk /dev/sdb

Press n to create a partition

Press p or l to create primary or logical partitions

Press w to write your changes or q to quit

### Format the partition

sudo mkfs -t ext4 /dev/sdb1

### Mount the partition

mkdir /data1

mount -t ext4 /dev/sdb1 /data1

### Get disk uuid
ls -al /dev/disk/by-uuid/
or
blkid

### To mount at the boot 

vi /etc/fstab file adjusting the UUID to your device's id and the directory to where you want to mount:

UUID=<uuid of the partition> /data1 ext4 defaults 0 0

mount -a - remounts filesystems from /etc/fstab

