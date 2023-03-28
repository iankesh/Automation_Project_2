#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
sudo systemctl status apache2
sudo systemctl restart apache2
sudo systemctl enable apache2

timestamp=$(date '+%d%m%Y-%H%M%S')
myname="ankesh"
s3_bucket="upgrad-ankesh"

cd /var/log/apache2/ && tar -cvf /tmp/${myname}-httpd-logs-${timestamp}.tar *.log

aws s3 \
cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
