#!/bin/bash

#Open the default terminal, with a specific geometry, and run the htop command. 
x-terminal-emulator --geometry=100x30+470+200 -e htop
#Use xdotool to ensure the terminal window retains focus. 
xdotool windowfocus --sync htop
