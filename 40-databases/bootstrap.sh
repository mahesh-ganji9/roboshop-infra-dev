#!/bin/bash

Component=$1
dnf install ansible -y
cd /home/ec2-user
git clone https://github.com/mahesh-ganji9/ansible-roboshop-roles-tf.git
cd ansible-roboshop-roles
ansible-playbook -e Component=$Component roboshop.yaml