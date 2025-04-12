#!/usr/bin/sudo bash

# Use Yad to show a message that rkhunter is updating its database
yad --text-info --title="Updating" --width=50 --height=20 --center --on-top --text="ClamAV is updating its database" --text-width=40 --text-align=center --borders=2 --icon-theme=Papirus --image-path=/usr/share/icons/Papirus/128x128/apps/ --image=org.gnome.dspy.svg --no-buttons --skip-taskbar --no-focus &

# Update the clamav database, then kill the Yad message above.
freshclam 
pkill yad
clamtk %F

