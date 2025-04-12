#!/bin/bash

killall conky
/usr/bin/conky -d -c ~/.config/conky/.conkyrc
exit
