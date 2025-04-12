#! /bin/bash

# Set monitor to 1920X1080 
gtf_output=$(gtf 1920 1080 60)
modeline=$(echo "$gtf_output" | grep "Modeline" | sed 's/.*Modeline //')
new_mode=$(echo "$modeline" | awk '{print $1}')
default_monitor=$(xrandr --listmonitors | grep '\*' | awk '{print $4}')
xrandr --output "$default_monitor" --mode "$new_mode" &

# Set wallpaper
if [ -f /usr/bin/nitrogen ]; then
nitrogen --restore &
fi

# Panel
if [ -f /usr/bin/tint2 ]; then
tint2 &
fi

# Right-click Menu
jgmenu_run apps &


# Run virus protection
sudo freshclam
sudo systemctl start clamav-freshclam


if [ -f /usr/bin/sparky-polkit ]; then
sparky-polkit &
fi
if [ -f /usr/bin/xscreensaver ]; then
xscreensaver -nosplash &
fi
if [ -f /opt/sparky/nm-applet-reload ]; then
/opt/sparky/nm-applet-reload &
fi
if [ -f /usr/bin/xfce4-power-manager ]; then
/usr/bin/xfce4-power-manager &
fi
if [ -f /usr/bin/xdg-user-dirs-gtk-update ]; then
/usr/bin/xdg-user-dirs-gtk-update &
fi
if [ -f /usr/bin/sparky-locker ]; then
sparky-locker &
fi
if [ -f /usr/bin/pnmixer ]; then
(sleep 15; pnmixer) &
fi
brightnessctl s 450 &
sleep 5
#if [ -f /usr/bin/pcmanfm ]; then
#pcmanfm -d &
#elif [ -f /usr/bin/thunar ]; then
#thunar --daemon &
#fi
#thunar --daemon &
conky --daemonize --pause=1 --config=/home/jeff/.config/conky/.conkyrc &
#sparky-backlight &
espanso service &
