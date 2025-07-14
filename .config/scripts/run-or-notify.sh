#!/bin/sh
cmd="$1"
shift

# Check if command exists (absolute paths work too)
if ! command -v "$cmd" >/dev/null 2>&1 && [ ! -x "$cmd" ]; then
    notify-send "command not found: $cmd"
    exit 127
fi

# Try to run the command
"$cmd" "$@"
status=$?
if [ $status -ne 0 ]; then
    notify-send "command failed ($status): $cmd"
    exit $status
fi
