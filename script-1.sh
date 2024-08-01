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
printf "%b\n" "\v\v\v------------------------------------------------------------" " " "\tDONE! Reboot and run script-2.sh." " " "------------------------------------------------------------" "\v\v\v "

