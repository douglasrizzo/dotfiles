#!/bin/sh

# Screen lock
# this one uses i3lock and displays images from a directory
# i3lock -c 0F121B -e -f -i $(find $1 -maxdepth 2 -name '*.png' -type f | shuf | head -n 1) -p win 

# this one uses xscreensaver
xscreensaver-command -lock

# this one uses blurlock, a program that comes with manjaro-3
# blurlock

exit 0
