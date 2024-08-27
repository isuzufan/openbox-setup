#!/bin/bash

### UPDATE ALL DEBIAN PACKAGES ###
sudo apt update
sudo apt upgrade -y


### XORG DISPLAY SERVER ###
sudo apt install -y xorg xbacklight xbindkeys xvkbd xinput


### BUILD-ESSENTIALS   ###
sudo apt install -y build-essential


### MICROCODE FOR INTEL & AMD ###
## Uncomment the line that’s appropriate for your hardware.
#sudo apt install -y amd64-microcode
sudo apt install -y intel-microcode


### WINDOW MANAGER & MENUS ###

# Openbox and Related Tools
sudo apt install -y openbox dunst dbus-x11 hsetroot libnotify-bin picom qt5-style-plugins 

# Menus
sudo apt install -y rofi jgmenu menu

# Panel & Decorations
sudo apt install -y tint2 conky-all 
 

### LOGIN MANAGER & SCREEN LOCK ###
sudo apt install -y lxdm i3lock 
sudo systemctl enable lxdm


### NETWORKING ###

# Wifi/Ethernet, Bluetooth, VPN
sudo apt install -y network-manager network-manager-gnome
sudo apt install -y blueman

# Local Networking & System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends
sudo systemctl enable avahi-daemon
sudo systemctl enable acpid


### FILE MANAGER & SEARCH ###
sudo apt install -y thunar thunar-archive-plugin xarchiver catfish


### TERMINAL EMULATOR ###
sudo apt install -y lxterminal


### SYSTEM INFO & MONITORING ###
sudo apt install -y neofetch htop


### SECURITY ###

# Anti-virus
sudo apt install -y clamtk rkhunter

# Firewall
sudo apt install -y gufw


### PACKAGE MANAGERS
sudo apt install -y gdebi synaptic


### WEB BROWSER  ###
sudo apt install -y firefox-esr


### AUDIO/VISUAL ###

# System Sound
sudo apt install -y pulseaudio also-utils pavucontrol volumeicon-alsa

# Monitor/Display
sudo apt install -y xrandr lxrandr

# Wallpaper Editor
sudo apt install -y nitrogen

# Media Player
sudo apt install -y vlc

# Image Viewer
sudo apt install -y shotwell shotwell-common

# PNG Resizer/Compressor
sudo apt install -y pngquant

# Screen Capture & Color Picker Tools
sudo apt install -y xfce4-screenshooter gpick


### DEVELOPMENT ###
sudo apt install -y yad


### FONTS & ICON THEMES ###

# Fonts
sudo apt install -y fonts-firacode fonts-liberation2 fonts-ubuntu fonts-dejavu fonts-roboto fonts-hack fonts-hack-ttf fonts-open-sans

# Icons
sudo apt install -y papirus-icon-theme breeze-icon-theme deepin-icon-theme faba-icon-theme suru-icon-theme obsidian-icon-theme
sudo wget 


### OTHER TOOLS ###

# Calculator
sudo apt install -y speedcrunch

# PDF Viewer
sudo apt install -y qpdfview

# Text Editor
sudo apt install -y geany geany-common

# Customization and Appearance
sudo apt install -y lxappearance qt5ct

# Power Management
sudo apt install -y xfce4-power-manager

# Font Viewer
sudo apt install -y fontmatrix

# Keyboard & Mouse Settings
sudo apt install -y lxinput

# On-screen Keyboard
sudo apt install -y onboard onboard-common


### CLEANUP ###
update-alternatives --set x-window-manager /usr/bin/openbox
sudo apt autoremove
printf "%b\n" "\v\v\v------------------------------------------------------------" " " "\tDONE! Reboot and run script-2.sh." " " "------------------------------------------------------------" "\v\v\v "



