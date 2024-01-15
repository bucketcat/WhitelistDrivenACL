#!/bin/bash


sudo userdel AdamA
sudo userdel PeterP
sudo userdel LisaP

sudo groupdel datagroup
sudo groupdel admingroup
sudo groupdel marketgroup


sudo rm -r data
sudo rm -r admin
sudo rm -r market



#Undoes main changes.