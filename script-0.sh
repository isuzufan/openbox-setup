#!/bin/bash

# Install git
sudo apt install git

# Clone Jeff's repository
git clone https://github.com/isuzufan/openbox-setup

# Change to the clone's directory and run first script
cd $HOME/openbox-setup
sudo chmod +x install-1.sh
./install-1.sh
