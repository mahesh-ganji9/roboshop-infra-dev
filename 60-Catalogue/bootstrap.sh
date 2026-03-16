#!/bin/bash

Component=$1
env=$2
app_version=$3
dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/mahesh-ganji9/ansible-roboshop-roles-tf.git
cd ansible-roboshop-roles-tf
git pull
ansible-playbook -e component=$Component -e env=$env app_version=$3 roboshop.yaml