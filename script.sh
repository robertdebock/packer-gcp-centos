#!/bin/sh

sudo touch /packer-was-here.txt
echo "Hello there." | sudo tee -a /etc/motd
sudo yum -y install httpd
sudo systemctl enable httpd.service
