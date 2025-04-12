#!/bin/bash


### SET SCREEN RESOLUTION ###
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


### SPARKY UTILITIES ###
# The following utilities are from the Sparky Linux distribution. You'll find them in the right-click menu.

## sparky-locker 


# sparky-polkit?


### CREATE BASIC USER FOLDERS ###
mkdir -p $HOME/Documents/
mkdir -p $HOME/Documents/scripts
mkdir -p $HOME/Documents/scripts/apps brightness conky graphics openbox security startup tint2
mkdir -p $HOME/.config # App-specific .config folders are created below, with other app-specific actions.  
mkdir -p $HOME/Pictures/
mkdir -p $HOME/Pictures/backgrounds icons


### SET BACKGROUNDS ###

## Grub
sudo cp --no-preserve=all $HOME/openbox-setup/.config/grub/grub /etc/default/grub/
sudo cp --no-preserve=all  $HOME/openbox-setup/backgrounds/purple_flower_grub.png /boot/grub/
sudo update-grub

## Login
sudo cp --no-preserve=all $HOME/openbox-setup/.config/50-Xorg_Resolution_Setting_1920x1080.conf /etc/X11/xorg.conf.d/
    #Rename to preserve original image
sudo cp --no-preserve=all /usr/share/images/desktop-base/login-background.svg /usr/share/images/desktop-base/login-background-ORIGINAL.svg
    #Copy new image to replace original
sudo cp --no-preserve=all $HOME/openbox-setup/backgrounds/blue-forest.svg /usr/share/images/desktop-base/login-background.svg

## Desktop
    # Copy over sample backgrounds
cp -r --no-preserve=all $HOME/openbox-setup/backgrounds/. $HOME/Pictures/backgrounds/
    # Temporarily set a nicer background than the default Debian image
nitrogen --set-zoom-fill --save $HOME/Pictures/wallpapers/minimal-landscape-1.jpg


### WINDOW MANAGER, PANEL & MENUS ###

## Desktop Files
    # Copy default .desktop files for all installed apps to .local folder
    # Many of these (not all) will be overwritten when individual software is configured below.
cp -r --no-preserve=all /usr/share/applications/. $HOME/.local/share/applications/

## Basik Jeff Theme
sudo cp -r --no-preserve=all $HOME/openbox-setup/themes/Bazik_Jeff /usr/share/themes/

## Openbox
mkdir $HOME/.config/openbox/
    # Copy over custom openbox icons
cp --no-preserve=all $HOME/openbox-setup/icons/openbox.png $HOME/Pictures/icons/
    # Copy over custom Openbox rc.xml and autostart.sh 
cp -r --no-preserve=all $HOME/openbox-setup/configs/openbox/. $HOME/.config/openbox/
    # Copy over custom desktop file and script for restarting Openbox
cp --no-preserve=all $HOME/openbox-setup/desktops/openbox_restart.desktop $HOME/.local/applications/
cp --no-preserve=all $HOME/openbox-setup/scripts/openbox/openbox-restart.sh $HOME/Documents/scripts/openbox/
    # Copy over custom desktop file for obconf (GUI app for managing openbox settings)
cp --no-preserve=all $HOME/openbox-setup/desktops/openbox/obconf.desktop $HOME/.local/applications/

## Tint2
    # Copy over custom tint2 icons
cp --no-preserve=all $HOME/openbox-setup/icons/{tint2.png tint2-conf.png} $HOME/Pictures/icons/
    # Create tint2 folder in /.config/
mkdir $HOME/.config/tint2/
    # Copy over custom tint2 config
cp --no-preserve=all $HOME/openbox-setup/configs/tint2/tint2rc $HOME/.config/tint2/
    # Copy over custom desktop files for tint2 and tint2conf
cp --no-preserve=all $HOME/openbox-setup/desktops/{tint2.desktop tint2conf.desktop} $HOME/.local/applications/
    # Copy over custom desktop file and script for restarting tint2
cp --no-preserve=all $HOME/openbox-setup/desktops/tint2-restart.desktop $HOME/.local/applications/
cp --no-preserve=all $HOME/openbox-setup/scripts/tint2/tint2-restart.sh $HOME/Documents/scripts/tint2/

## Conky
    # Create conky folder in /.config/
mkdir $HOME/.config/conky/
    # Copy over custom Conky config
cp --no-preserve=all $HOME/openbox-setup/configs/conky/.conkyrc $HOME/.config/conky/
    # Copy over custom desktop files for Conky and the Conky Restart script
cp --no-preserve=all $HOME/openbox-setup/desktops/{conky.desktop conky-restart.desktop} $HOME/.local/applications/
    # Copy over script for restarting Conky
cp --no-preserve=all $HOME/openbox-setup/scripts/conky/conky-restart.sh $HOME/Documents/scripts/conky/

## Jgmenu
    # Copy over custom jgmenu icons
cp --no-preserve=all $HOME/openbox-setup/icons/{gradient-burger_50px.png gradient-burger_60px.png gradient-burger_70px.png gradient-burger_140x60px.png gradient-burger.png} $HOME/Pictures/icons/
    # Create jgmenu folder in /.config/
mkdir $HOME/.config/jgmenu/
    # Copy over custom jgmenu configs
cp --no-preserve=all $HOME/openbox-setup/configs/jgmenu/{append.csv jgmenurc prepend.csv schema} $HOME/.config/jgmenu/
    # Copy over custom desktop files for jgmenu
cp --no-preserve=all $HOME/openbox-setup/desktops/jgmenu.desktop $HOME/.local/applications/

## Rofi
    # Create rofi folder in /.config/
mkdir $HOME/.config/rofi/
    # Copy over custom rofi configs
cp --no-preserve=all $HOME/openbox-setup/configs/rofi/{config.rasi paper-float.rasi paper-float-blue.rasi} $HOME/.config/rofi
    # Copy over custom desktop file for rofi
cp --no-preserve=all $HOME/openbox-setup/desktops/{rofi.desktop rofi-theme-selector.deskop} $HOME/.local/applications/


### UTILITIES SETUP ###

## Terminal
    # Create lxterminal folder in /.config/
mkdir $HOME/.config/lxterminal/
    # Copy over custom lxterminal config file
cp --no-preserve=all $HOME/openbox-setup/configs/lxterminal/lxterminal.conf $HOME/.config/lxterminal

## Brightness
    # Copy over script
cp --no-preserve=all $HOME/openbox-setup/scripts/brightness/set_brightness.sh $HOME/Documents/scripts/brightness/
    # Copy over custom desktop file 
cp --no-peserve=all $HOME/openbox-setup/desktops/brightness.desktop $HOME/.local/applications/

## Bluetooth & Audio
cp --no-preserve=all $HOME/openbox-setup/desktops/{blueman-adapters.desktop blueman-manager.desktop} $HOME/.local/applications/
cp --no-peserve=all $HOME/openbox-setup/desktops/pavucontrol.desktop $HOME/.local/applications/

## Display
cp --no-peserve=all $HOME/openbox-setup/desktops/lxrandr.desktop $HOME/.local/applications/

## Keyboard & Mouse
# lxinput
cp --no-peserve=all $HOME/openbox-setup/desktops/lxinput.desktop $HOME/.local/applications/
# onboard
cp --no-peserve=all $HOME/openbox-setup/desktops/onboard.desktop $HOME/.local/applications/

## Network
# nm-applet & nm-connection-editor
cp --no-peserve=all $HOME/openbox-setup/desktops/{nm-applet.desktop nm-connection-editor} $HOME/.local/applications/

## File Manager & Search
# copy over desktop files for catfish, thunar, thunar-settings, thunar-volman-settings, thunar-bulk-rename
cp --no-peserve=all $HOME/openbox-setup/desktops/{thunar-bulk-rename.desktop thunar-settings.desktop thunar-volman-settings.desktop thunar.desktop thunar-root.desktop org.xfce.Catfish.desktop} $HOME/.local/applications/
 # copy over the thunar-root.sh script. This will be run only when you the "File Manager (as root)" option in the Openbox menu.
 cp --no-preserve=all $HOME/openbox-setup/scripts/apps/thunar-root.sh $HOME/Documents/scripts/apps/

## Settings
# lxappearance
 cp --no-peserve=all $HOME/openbox-setup/desktops/lxappearance.desktop $HOME/.local/applications/

## Monitor (lxrandr)
# Copy over the lxrandr desktop file. 
 cp --no-peserve=all $HOME/openbox-setup/desktops/lxrandr.desktop $HOME/.local/applications/
 # Copy a script that (1) ensures 1920x1080 is a recognized mode and (2) sets the system's resolution to that mode for the default monitor.  
 cp --no-peserve=all $HOME/openbox-setup/scripts/graphics/monitor-setup.sh $HOME/Documents/scripts/graphics/
 # Make the script executable
 chmod +x $HOME/Documents/scripts/graphics/monitor-setup.sh
 # Run the script
 ./$HOME/Documents/scripts/graphics/monitor-setup.sh

## Logout


### SECURITY SETUP ###

## Virus Protection
    cp --no-peserve=all $HOME/openbox-setup/desktops/clamtk.desktop $HOME/.local/applications/
    sudo systemctl stop clamav-freshclam
    sudo mkdir /var/lib/clamav
    sudo freshclam
    sudo systemctl start clamav-freshclam

## Firewall
    cp --no-peserve=all $HOME/openbox-setup/desktops/gufw.desktop $HOME/.local/applications/
    cp --no-peserve=all $HOME/openbox-setup/scripts/security/gufw.sh $HOME/Documents/scripts/security/
    chmod +x $HOME/Documents/scripts/graphics/gufw.sh

# Change Password
    cp --no-peserve=all $HOME/openbox-setup/desktops/password.desktop $HOME/.local/applications/




## Other
#system-config-printer




### APPLICATIONS SETUP ###

## Web Browser
    sudo update-alternatives --set x-www-browser /usr/bin/firefox-esr

## Geany
# Create geany folder in /.config/
    mkdir $HOME/.config/geany/
# Rename original geany config file to preserve it. 
    cp -a $HOME/.config/geany/geany.conf $HOME/.config/geany/geany_ORIGINAL.conf
# Copy over new, custom geany config file.
    cp -a $HOME/openbox-setup/.config/geany/geany.conf $HOME/.config/geany/
# Set geany as default text editor
    sudo update-alternatives --set editor /usr/bin/geany 

## htop
    cp -a $HOME/openbox-setup/.config/htop/htoprc $HOME/.config/htop/

## LXTerminal
    sudo update-alternatives --set x-terminal-emulator /usr/bin/lxterminal
    cp -a $HOME/openbox-setup/.config/lxterminal/lxterminal.conf $HOME/.config/lxterminal/

## SpeedCrunch Calculator
    cp $HOME/openbox-setup/.config/SpeedCrunch.ini $HOME/.config/SpeedCrunch/

## Synaptic
    cp --no-peserve=all $HOME/openbox-setup/desktops/synaptic.desktop $HOME/.local/applications/

## Font Viewer
# fontmatrix.  default desktop will be copied into .local, but I need to see where it appears in the right-click menu and then possibly adjust the Categories












### CLEANUP
printf "%b\n" "\v\v\v------------------------------------------------------------" " " "\tDONE! Rebooting in 5 seconds." " " "------------------------------------------------------------" "\v\v\v "
sleep 8
sudo systemctl reboot
