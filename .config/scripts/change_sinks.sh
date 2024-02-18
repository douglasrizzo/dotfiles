#!/usr/bin/env sh
# A script that allows a the user to select a different default audio sink using dmenu

# If more than one non-default sink available, all sinks are listed for choosing
if ($(pactl list sinks | grep -e 'State:' | wc -l) >1); then
	VAL=$(pactl list sinks | grep -e 'Name:' | sed -r 's/.*Name: (.*)/\1/' | sort | dmenu -l 5)
	if [ "$VAL" != "" ]; then
		pactl set-default-sink $VAL
	fi
# else, swap the port of the current sink between headphone and speaker
elif pactl list sinks | grep -e 'Active Port: analog-output-speaker'; then
	pactl set-sink-port 0 analog-output-headphones
else
	pactl set-sink-port 0 analog-output-speaker
fi
