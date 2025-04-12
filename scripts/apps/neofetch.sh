#!/bin/bash

#Open the default terminal, with a specific geometry, and run the neofetch command. 
x-terminal-emulator --title neofetch --geometry=100x30+370+200 -e neofetch
#Use xdotool to ensure the terminal window retains focus. 
#xdotool windowfocus --sync neofetch
sleep 20
read
