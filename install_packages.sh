#!bin/bash

<<note
This script will install NGINIX
note

<<install_ng
echo "---------------------INSTALLING NGINIX--------"
sudo apt-get update
sudo apt-get install nginx -y  #-y is input which asking at run time
sudo systemctl start nginx # nigin start karega
sudo systemctl enable nginx # jab bhi compute restart/reboot hoga enable 
echo "--------------INSTALLED NGINX-----"
install_ng

<<comment
Istalling pacakge as per input or argument
comment

echo "----Installing $1-----"
sudo apt-get update
sudo apt-get install $1
sudo systemctl start $1
sudo systemctl enable $1
echo "-----INSTALLATION SUCCESSFUL------"
