#!/bin/sh

# Nerd Font Icons
ICON_VRAM="󰍛" # microchip
ICON_TEMP="󰔄" # thermometer
ICON_UTIL="󱄄" # speedometer

if output=$(nvidia-smi --query-gpu memory.used,memory.total,temperature.gpu,utilization.gpu --format=csv,noheader,nounits -i 0 2>/dev/null); then
    echo "$output" | awk -v vram="$ICON_VRAM" -v temp="$ICON_TEMP" -v util="$ICON_UTIL" '{
        split($0,a,", ");
        printf "%s %4dMiB (%3d%%) | %d%s | %s %3d%%", vram, a[1], a[1]/a[2]*100, a[3], temp, util, a[4]
    }'
else
    echo "GPU stats not available"
fi
