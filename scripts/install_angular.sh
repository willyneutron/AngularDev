#!/bin/bash

# Script for installing nodejs and yo-angular in ubuntu
#
# Based on:
#  - http://yeoman.io/codelab/install-gen
#  - https://github.com/nodesource/distributionserators.html
#  - https://gist.github.com/stephou0104/233b5c99884f1d8c8b8b
#
# Guillermo Climent <willyneutron2@gmail.com>
# 1-jan-16

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
blue " Updating necessary packages from package manager..."
sudo apt-get update
sudo curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
sudo apt-get install -y nodejs git
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

datetime_cyan
blue " Installing Ruby SASS compass..."
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
rvm install 2.1.2
rvm use 2.1.2 --default
gem update --system
gem install compass

datetime_cyan
blue " Cleaning NPM cache..."
sudo npm cache clean

datetime_cyan
blue " Updating NPM..."
sudo npm install --global npm@latest

datetime_cyan
blue " Installing Yeoman toolset..."
sudo npm install --global yo bower grunt-cli

datetime_cyan
blue "Installing angular generator..."
sudo npm install --global generator-angular generator-karma

datetime_cyan
green " Done!"


