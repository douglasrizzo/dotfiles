#!/bin/sh

# Screen lock
# this one uses i3lock and displays images from a directory
# i3lock -c 0F121B -e -f -i $(find $1 -maxdepth 2 -name '*.png' -type f | shuf | head -n 1) -p win

# this one uses xscreensaver
if ! pidof -s xscreensaver >/dev/null; then
    notify-send 'starting xscreensaver daemon, wait a few seconds...'
    xscreensaver &

    until pids=$(pidof xscreensaver); do
        sleep 1
    done

    notify-send 'daemon started, try locking now'
else
    xscreensaver-command -lock
fi

# this one uses blurlock, a program that comes with manjaro-3
# blurlock

exit 0
