#!/bin/sh

volume_up() {
	get_sink
	sink=$?
	pactl set-sink-volume $sink +1%
}

volume_down() {
	get_sink
	sink=$?
	pactl set-sink-volume $sink -1%
}

volume_mute() {
	get_sink
	sink=$?
	pactl set-sink-mute $sink toggle
}

get_sink() {
	if pacmd list-sinks | grep active | head -n 1 | grep -q hdmi; then
		retval=1
	else
		retval=0
	fi
	return "$retval"
}

switch_sink() {
	get_sink
	sink=$?

	if pacmd list-sinks | grep active | grep -q headphones; then
		pactl set-sink-port $sink analog-output-speaker
	elif pacmd list-sinks | grep active | grep -q speaker; then
		pactl set-sink-port $sink analog-output-headphones
	fi
}

volume_print() {
	icon=""

	if pacmd list-sinks | grep active | grep -q hdmi; then
		icon="$icon"
	fi
	if pacmd list-sinks | grep active | grep -q speaker; then
		icon="$icon"
	fi
	if pacmd list-sinks | grep active | grep -q headphones; then
		icon="$icon"
	fi
	if [ ! "$icon" ]; then
		icon=""
	fi

	get_sink
	sink=$?

	muted=$(pamixer --sink $sink --get-mute)

	if [ "$muted" = true ]; then
		echo "$icon --"
	else
		echo "$icon $(pamixer --sink $sink --get-volume)"
	fi
}

listen() {
	volume_print

	pactl subscribe | while read -r event; do
		if echo "$event" | grep -q "#$sink"; then
			volume_print
		fi
	done
}

case "$1" in
--up)
	volume_up
	;;
--down)
	volume_down
	;;
--mute)
	volume_mute
	;;
--switch)
	switch_sink
	;;
*)
	listen
	;;
esac
