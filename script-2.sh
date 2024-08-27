#!/bin/bash


### SET SCREEN RESOLUTION
# Default is 1920x1080. Uncomment others below to match your monitor. 
# Not listed? Run xrandr in a terminal for available resolutions. 
# Add yours using the format below.
xrandr -s 1920x1080_60.00
#xrandr -s 1366×768_59.79
#xrandr -s 1280×1024_60.02
#xrandr -s 1440×900_59.89
#xrandr -s 1600×900_60.00
#xrandr -s 1680×1050_59.95
#xrandr -s 1280×800_59.81
#xrandr -s 1024×768_60.00


### CREATE BASIC FOLDERS
mkdir -p $HOME/Documents/
mkdir -p $HOME/Documents/scripts
mkdir -p $HOME/Documents/scripts/apps conky graphics openbox security startup tint2
mkdir -p $HOME/Pictures/
mkdir -p $HOME/Pictures/backgrounds icons



### SET BACKGROUNDS ###

## Grub
sudo cp -a $HOME/openbox-setup/.config/grub /etc/default/grub
sudo cp -a $HOME/openbox-setup/backgrounds/purple_flower_grub.png /boot/grub
sudo update-grub

## Login
sudo cp -v $HOME/openbox-setup/.config/50-Xorg_Resolution_Setting_1920x1080.conf /etc/X11/xorg.conf.d/
    #Rename to preserve original image
sudo cp -v /usr/share/images/desktop-base/login-background.svg /usr/share/images/desktop-base/login-background-ORIGINAL.svg
    #Copy new image to replace original
sudo cp -v $HOME/openbox-setup/backgrounds/blue-forest.svg /usr/share/images/desktop-base/login-background.svg

## Openbox/Nitrogen
sudo cp -a $HOME/openbox-setup/backgrounds/. $HOME/Pictures/backgrounds/
nitrogen --set-zoom-fill --save $HOME/Pictures/wallpapers/bicycle-girl.jpg


### SETUP SYSTEM ###

## Copy Scripts



#GTK THEMES?


### SETUP APPLICATIONS ###

## Copy Default .desktop Files then Overwrite with Custom Ones
sudo cp -a /usr/share/applications/. $HOME/.local/share/applications
cp $HOME/openbox-setup/.desktop/. $HOME/.local/share/applications

## Copy Supporting Icons
cp -a $HOME/openbox-setup/icons/launcher-menu/. $HOME/Pictures/icons/launcher-menu/

## Web Browser
sudo update-alternatives --set x-www-browser /usr/bin/firefox-esr

## OpenBox
mkdir $HOME/.config/openbox/
cp -a $HOME/openbox-setup/.config/{autostart,rc.xml} $HOME/.config/openbox/

## Geany
sudo update-alternatives --set editor /usr/bin/geany 
cp -a $HOME/.config/geany/geany.conf $HOME/.config/geany/geany_ORIGINAL.conf
cp -a $HOME/openbox-setup/.config/geany.conf $HOME/.config/geany/

## HTOP
cp -a $HOME/openbox-setup/.config/htoprc $HOME/.config/htop/htoppc

## LXTerminal
sudo update-alternatives --set x-terminal-emulator /usr/bin/lxterminal
cp -a $HOME/openbox-setup/.config/lxterminal.conf $HOME/.config/lxterminal/

## Virus Protection
sudo systemctl stop clamav-freshclam
sudo mkdir /var/lib/clamav
sudo freshclam
sudo systemctl start clamav-freshclam

## Conky


## Jgmenu


## SpeedCrunch Calculator
cp $HOME/openbox-setup/.config/SpeedCrunch.ini $HOME/.config/SpeedCrunch/

## Brightness










### CLEANUP
printf "%b\n" "\v\v\v------------------------------------------------------------" " " "\tDONE! Rebooting in 5 seconds." " " "------------------------------------------------------------" "\v\v\v "
sleep 8
sudo systemctl reboot
