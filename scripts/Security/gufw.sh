#!/bin/bash

#Open a terminal window, with a specific title and geometry, and launch thunar as sudo
x-terminal-emulator -t "Password, Please!" --geometry=50x3+670+400 -e sudo gufw /
#Use xdotool to ensure the password prompt window retains focus. 
xdotool windowfocus --sync "Password, Please!"
