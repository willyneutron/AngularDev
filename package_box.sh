#!/bin/bash

# Script for packaging a VM into a Vagrant box.
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

function red(){
	echo -e "\e[31m$*\e[0m"
}

# Check arguments
if [ -z "$1" ]
  then
    red "$(tput bold)No VM name supplied!$(tput sgr0)"
    exit
fi

if [ -z "$2" ]
  then
    red "$(tput bold)No box output filename supplied!$(tput sgr0)"
    exit
fi

datetime_cyan
cyan " Bringing up VM..."
vagrant up

datetime_cyan
cyan " Cleaning VM for packaging..."
vagrant ssh -c "/vagrant/scripts/clean_dist.sh"

datetime_cyan
cyan " Packaing $1 into $2..."
vagrant package $1 --output $2
