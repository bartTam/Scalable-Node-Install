#!/bin/sh

sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get install python3-pip git

sudo pip3 install --upgrade pip
sudo pip3 install Flask

