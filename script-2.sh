#!/bin/bash

# Install xorg display server
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput

# The build-essential package 
sudo apt install -y build-essential

# Microcode for Intel or AMD. Uncomment the line below that’s appropriate for your hardware.
#sudo apt install -y amd64-microcode
#sudo apt install -y intel-microcode

# Network file tools/system events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# File manager. This installs pcmanfm, but you can substitute your preferred file manager.
sudo apt install -y thunar

# Terminal. This installs lxterminal, but you can substitute your preferred terminal emulator.
sudo apt install -y lxterminal

# Sound
sudo apt install -y pulseaudio also-utils pavucontrol volumeicon-alsa

# System info & monitoring 
sudo apt install -y neofetch htop

# Network manager
sudo apt install -y network-manager network-manager-gnome

# Customization & appearance management
sudo apt install -y lxappearance

# Web browser. This installs firefox, but you can substitute your preferred browser.
sudo apt install -y firefox-esr

# Wallpaper manager. 
# First, we copy sample images from the setup package.
cp -a $HOME/openbox-setup/wallpapers/ $HOME/Pictures/
# Then we install nitrogen and use it to set a background image. 
# If you prefer feh, uncomment the two lines that accomplish the same. 
sudo apt install -y nitrogen
nitrogen --set-zoom-fill --save $HOME/Pictures/wallpapers/bicycle-girl.jpg
#sudo apt install -y feh
#feh –bg-fill $HOME/Pictures/wallpapers/bicycle-girl.jpg

# Fonts and icon themes
sudo apt install -y fonts-firacode fonts-liberation2 fonts-ubuntu papirus-icon-theme fonts-cascadia-code

# Openbox 
sudo apt install -y openbox dunst dbus-x11 hsetroot i3lock libnotify-bin lximage-qt menu picom qt5-style-plugins rofi scrot tint2 xfce4-power-manager

# LXDM login manager
sudo apt install -y lxdm
sudo systemctl enable lxdm

# Cleanup
sudo apt autoremove
printf "%b\n" "\v\v\v------------------------------------------------------------" " " "\tDONE! Reboot and run script-3.sh." " " "------------------------------------------------------------" "\v\v\v "



