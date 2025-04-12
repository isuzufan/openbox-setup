#!/bin/bash

# Saves output of 'brightnessctl i' to the 'info' variable
info=$(brightnessctl i)

# Extract monitor name from $info
monitor=$(echo "$info" | grep -oP "(?<=Device ')[^']+")

# Extract current brightness level from $info
current_brightness=$(echo "$info" | grep -oP 'Current brightness: \K.*')
# current_brightness=$(brightnessctl g)

# Extract maximum brightness from $info
# max_brightness=$(echo "$info" | grep -oP 'Max brightness: \K.*')
max_brightness=$(brightnessctl m)

# Message
message="Current brightness: $current_brightness.\n\nType a new value between 0 and $max_brightness."

# Creates a Yad window with our $message and a text field.
new_brightness=$(yad --width=300 --height=200 --title="Set Brightness" --entry --text="$message" --center --on-top)

# Check if the user canceled the dialog
if [ $? -ne 0 ]; then
    exit 1
fi

# 
brightnessctl s $new_brightness

