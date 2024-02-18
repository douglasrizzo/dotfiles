#!/usr/bin/env sh
setpci -s 01:00.0 0x488.l=0x2000000:0x2000000
rmmod nvidia-drm nvidia-modeset nvidia
echo 1 >/sys/bus/pci/devices/0000:01:00.0/remove
echo 1 >/sys/bus/pci/devices/0000:00:01.0/rescan
modprobe nvidia-drm
xinit -- -retro
