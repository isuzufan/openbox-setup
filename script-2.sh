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
mkdir -p $HOME/Pictures/
mkdir -p $HOME/.config



### SET BACKGROUNDS

## Grub
#	Copy grub config and add background to correct folder
sudo cp $HOME/openbox-setup/configs/grub /etc/default/grub
sudo cp $HOME/openbox-setup/backgrounds/purple_flower_grub.png /boot/grub
sudo update-grub

## Login
#	Copy xorg conf file. No previous file, so nothing overwtitten.
sudo cp -v $HOME/openbox-setup/configs/50-Xorg_Resolution_Setting_1920x1080.conf /etc/X11/xorg.conf.d/50-Xorg_Resolution_Setting_1920x1080.conf
#	Rename to preserve original image.
sudo cp -v /usr/share/images/desktop-base/login-background.svg /usr/share/images/desktop-base/login-background-ORIGINAL.svg
#	Copy new image to replace original
sudo cp -v $HOME/openbox-setup/backgrounds/blue-forest.svg /usr/share/images/desktop-base/login-background.svg

## Openbox
sudo cp -a $HOME/openbox-setup/backgrounds/ $HOME/Pictures/wallpapers/
nitrogen --set-zoom-fill --save $HOME/Pictures/wallpapers/bicycle-girl.jpg

## Web Browser
sudo update-alternatives --set x-www-browser /usr/bin/brave-browser

### SETUP APPLICATIONS

## OpenBox
mkdir $HOME/.config/openbox/
sudo cp $HOME/openbox-setup/configs/{autostart,rc.xml} $HOME/.config/openbox/

## Geany
sudo update-alternatives --set editor /usr/bin/geany 
sudo cp $HOME/.config/geany/geany.conf $HOME/.config/geany/geany_ORIGINAL.conf
sudo cp $HOME/openbox-setup/configs/geany.conf $HOME/.config/geany/

## HTOP
sudo cp $HOME/.config/htop/htoprc $HOME/.config/htop/htoprc_ORIGINAL
sudo cp $HOME/openbox-setup/configs/htoprc $HOME/.config/htop/htoppc

## LXTerminal
sudo update-alternatives --set x-terminal-emulator /usr/bin/lxterminal
sudo cp $HOME/openbox-setup/configs/lxterminal.conf $HOME/.config/lxterminal/

## Virus Protection
sudo systemctl stop clamav-freshclam
sudo mkdir /var/lib/clamav
sudo freshclam
sudo systemctl start clamav-freshclam

## Conky


## Jgmenu


## SpeedCrunch Calculator
sudo cp $HOME/openbox-setup/configs/SpeedCrunch.ini $HOME/.config/SpeedCrunch/







sudo update-alternatives --set x-terminal-emulator /usr/bin/lxterminal



### Copy application .desktop files
sudo cp -a /usr/share/applications/ $HOME/.local/share/applications/



# Overwrite local .desktop files
# Copy .config files



### CLEANUP
printf "%b\n" "\v\v\v------------------------------------------------------------" " " "\tDONE! Rebooting in 5 seconds." " " "------------------------------------------------------------" "\v\v\v "
sleep 8
sudo systemctl reboot
