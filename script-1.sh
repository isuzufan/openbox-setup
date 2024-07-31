#!/bin/bash

# Create basic folders
mkdir -p $HOME/Documents/
mkdir -p $HOME/Pictures/
mkdir -p $HOME/.config

# Update all Debian packages
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Cleanup
printf "\e[1;32mDone!  Please reboot and run Script 2.\e[0m\n

