#!/bin/bash

# Script for bringing up Angular development VM
#
# Guillermo Climent <willyneutron2@gmail.com>
# 13-jan-16

function datetime_cyan(){
	bold=$(tput bold)
	normal=$(tput sgr0)
	printf "${bold}\e[36m[$(date +'%T')]${normal}\e[0m"
}

function cyan(){
	echo -e "\e[36m$*\e[0m"
}

function green(){
	echo -e "\e[32m$*\e[0m"
}

function pause(){
	read -p "$*"
}

datetime_cyan
cyan " Please, configure the VM as you want."
pause "Press a key to open editor"
nano Vagrantfile

datetime_cyan
cyan " Bringing up VM..."
vagrant up

datetime_cyan
cyan " Poblating angular environment..."
vagrant ssh -c "/vagrant/scripts/install_angular.sh"

datetime_cyan
green " ALL DONE!"
