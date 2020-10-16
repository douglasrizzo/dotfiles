#!/usr/bin/env sh
set -e

# https://github.com/philippnormann/xrandr-brightness-script
# License is GPL v3
if ! command -v bc &>/dev/null; then
    echo "bc command could not be found, it's needed to run this script."
    exit
fi

get_brightness() {
    xrandr --verbose | grep -m 1 -w "$1 connected" -A8 | grep "Brightness: " | cut -f2- -d: | tr -d ' '
}

list_displays() {
    echo 'displays:'
    displist=''
    connected=$(xrandr | grep -w connected | cut -f1 -d' ')
    for display in $connected; do
        brightness=$(get_brightness "$display")
        displist+="$display brightness: $brightness"
        displist+=$'\n'
    done
    echo "$displist" | column -t | sed 's/^/  /'
}

display_usage() {
    script_name=$(basename "$0")
    echo "Usage: $script_name op display [stepsize|value]"
    echo
    echo 'arguments:'
    echo '  op:             '-' to decrease or '+' to increase brightness'
    echo '                  '=' to set brightness to a specific value'
    echo '  display:        name of a connected display to adjust'
    echo '  stepsize:       size of adjustment step (default 0.1)'
    echo '  value:          value to set (default 1.0)'
    echo
    list_displays
}

exec_op() {
    if [ "$1" = '+' ]; then
        NEWVAL=$(echo "$3 + $2" | bc)
    elif [ "$1" = '-' ]; then
        NEWVAL=$(echo "$3 - $2" | bc)
    elif [ "$1" = '=' ]; then
        NEWVAL=$2
    fi
    if [ "$(echo "$NEWVAL < 0.0" | bc)" -eq 1 ]; then
        NEWVAL='0.0'
    fi
    if [ "$(echo "$NEWVAL > 1.0" | bc)" -eq 1 ]; then
        NEWVAL='1.0'
    fi
    echo "$NEWVAL"
}

if [[ "$1" = '+' || "$1" = '-' || "$1" = '=' ]] && [[ -n "$2" ]]; then
    OP=$1
    DISP=$2
    shift
    shift
else
    display_usage
    exit 1
fi

if [[ "$1" =~ ^[0-9]+(.[0-9]+)?$ ]]; then
    OPVAL=$1
    shift
else
    if [[ "$OP" = '=' ]]; then
        if [[ "$1" = '--temp' ]]; then
            OPVAL='0.6'
        else
            OPVAL='1.0'
        fi
    else
        OPVAL='0.1'
    fi
fi

CURRBRIGHT=$(get_brightness "$DISP")
if [[ ! "$CURRBRIGHT" =~ ^[0-9]+.[0-9]+$ ]]; then
    echo "Error: Selected display $DISP has no brightness value!"
    echo
    list_displays
    exit 1
fi

NEWBRIGHT=$(exec_op "$OP" "$OPVAL" "$CURRBRIGHT")

xrandr --output "$DISP" --brightness "$NEWBRIGHT"
