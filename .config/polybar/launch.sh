#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload $1 &
done

echo "Bars launched..."
