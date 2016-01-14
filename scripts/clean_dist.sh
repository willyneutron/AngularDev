#!/bin/bash

# Script for creating a Ubuntu VM for packaging into Vagrant box.
#
# Based on:
#	https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
#
# Guillermo Climent <willyneutron2@gmail.com>
# 13-jan-16

# Color functions
function datetime_cyan(){
	bold=$(tput bold)
	normal=$(tput sgr0)
	printf "${bold}\e[36m[$(date +'%T')]${normal}\e[0m"
}
function green(){
	echo -e "\e[32m$*\e[0m"
}
function blue(){
	echo -e "\e[34m$*\e[0m"
}

datetime_cyan
blue " Cleaning APT cache..."
sudo apt-get clean

datetime_cyan
blue " Cleaning up dhcp leases..."
sudo rm /var/lib/dhcp/*

datetime_cyan
blue " Cleaning up udev rules..."
sudo rm /etc/udev/rules.d/70-persistent-net.rules
sudo mkdir /etc/udev/rules.d/70-persistent-net.rules
sudo rm -rf /dev/.udev/
sudo rm /lib/udev/rules.d/75-persistent-net-generator.rules

datetime_cyan
blue " Adding a 2 sec delay to the interface up, to make the dhclient happy..."
sudo echo "pre-up sleep 2" >> sudo /etc/network/interfaces

datetime_cyan
blue " Emptying filesystem..."
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY

datetime_cyan
blue " Cleaning bash history..."
cat /dev/null > ~/.bash_history && history -c

datetime_cyan
green " DONE!"
