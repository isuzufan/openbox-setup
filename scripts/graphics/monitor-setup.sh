   



#!/bin/bash

# This script makes sure that the system has a modeline for a 1920X1080 monitor, and then sets the default monitor to that resolution. 

# Run the gtf command and save the output
gtf_output=$(gtf 1920 1080 60)

# Extract the text after "Modeline" and save it as a variable
modeline=$(echo "$gtf_output" | grep "Modeline" | sed 's/.*Modeline //')

# Extract the name of the new mode (first part of the modeline)
new_mode=$(echo "$modeline" | awk '{print $1}')

# Add the new mode using xrandr
xrandr --newmode $modeline

# Identify the default monitor and save its name as a variable
default_monitor=$(xrandr --listmonitors | grep '\*' | awk '{print $4}')

# Add the new mode to the default monitor
xrandr --addmode "$default_monitor" "$new_mode"

# Set the resolution of the default monitor to the new mode
xrandr --output "$default_monitor" --mode "$new_mode"










