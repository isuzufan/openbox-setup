#!/bin/bash

# Use Yad to show a message that rkhunter is updating its database
yad --text-info --title="Update" --width=50 --height=20 --center --on-top --text="rkhunter is updating its database" --text-width=40 --text-align=center --borders=2 --icon-theme=Papirus --image-path=/usr/share/icons/Papirus/128x128/apps/ --image=org.gnome.dspy.svg --no-buttons --skip-taskbar --no-focus &

# Update the rkhunter database, then kill the Yad message above.
rkhunter --update 
pkill yad

# Run rkhunter in a terminal window
x-terminal-emulator --geometry=150x100 -e sudo rkhunter -c -sk --display-logfile --noappend-log
