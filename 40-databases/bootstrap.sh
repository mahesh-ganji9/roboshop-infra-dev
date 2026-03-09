#!/bin/bash

Component=$1
dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/mahesh-ganji9/ansible-roboshop-roles-tf.git
git pull
cd ansible-roboshop-roles-tf
ansible-playbook -e component=$Component roboshop.yaml