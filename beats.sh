#!/bin/bash

case $1 in
   kafka)
      echo "configure Kafka"
      echo "Take backup of filebeat.yml"
      cp /opt/filebeat/filebeat-8.0.1/filebeat.yml /opt/filebeat/filebeat-8.0.1/filebeat.bak.elastic.yml
      echo "Stop filebeat"
      sudo systemctl stop filebeat_eck
      echo "TODO - copy the file"
      echo "Start filebeat"
      sudo systemctl start filebeat_eck
      echo "Status of filebeat service"
      sudo systemctl status filebeat_eck.service

      echo "Take backup of metricbeat.yml"
      cp /opt/metricbeat/metricbeat-8.0.1/metricbeat.yml /opt/metricbeat/metricbeat-8.0.1/metricbeat.bak.elastic.yml
      echo "Stop metricbeat"
      sudo systemctl stop metricbeat_eck
      echo "TODO - copy the file"
      echo "Start metricbeat"
      sudo systemctl start metricbeat_eck
      echo "Status of metricbeat service"      
      sudo systemctl status  metricbeat_eck.service

      ;;
   test)
      echo "Creating the required folders and files for testing kafka"
      mkdir /opt/filebeat/filebeat-8.0.1
      echo "Test filebeat file" > /opt/filebeat/filebeat-8.0.1/filebeat.yml
      mkdir /opt/metricbeat/metricbeat-8.0.1      
      echo "Test metricbeat file" > /opt/metricbeat/metricbeat-8.0.1/metricbeat.yml
      ;;   
   *)
      echo "Unknown"
      ;;
   esac
