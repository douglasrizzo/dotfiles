#!/usr/bin/env sh
if synclient -l | grep "TouchpadOff .*=.*0"; then
	synclient TouchpadOff=1
else
	synclient TouchpadOff=0
fi
