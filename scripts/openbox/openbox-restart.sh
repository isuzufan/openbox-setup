#!/bin/bash

killall conky
openbox --restart
sleep 1
/usr/bin/conky -d -c ~/.config/conky/.conkyrc
