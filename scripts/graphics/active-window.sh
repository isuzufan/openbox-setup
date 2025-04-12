#!/bin/bash

#Use Scrot to take a screen capture of the active screen, save the image to a file, 
#and then use pngquant to optimize and overwrite that file.
#
#This script is bound to the Alt+Shift+w key combo in ~/.config/openbox/rc.xml .
#
#Scrot options are:
# -u specifies the active window
# -b includes the window's border
# -p includes the pointer
# -q specifies image quality (1-100)
# -F sets the output path and file name
# -e adds the command to run pngquant with its own options
#
#pngquant options are: 
# $f identifies the full path of the image from Scrot
# -s sets the speed on a scale of 1 (slow) to 11 (fast)
# -o sets pngquant's output path and file name
# -f tells pngquant to overwrite any already-existing file with that same name
# --strip removes unnecessary metadata
scrot -u -b -p -q 99 -F $HOME/.tmp/tmp-scrot-output.png -e 'pngquant $f -s 10 -o $HOME/.tmp/tmp-scrot-output.png -f --strip'

#Open the temporary file in the Shotwell image editor, wait 3 seconds, and then delete the temporary file from disk. (Image stays alive in Shotwell until saved/discarded.)
shotwell $HOME/.tmp/tmp-scrot-output.png &
sleep 3
rm $HOME/.tmp/tmp-scrot-output.png
