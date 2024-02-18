#!/bin/sh

nvidia-smi --query-gpu memory.used,memory.total,temperature.gpu,utilization.gpu --format=csv,noheader,nounits -i 0 | awk '{
    split($0,a,", ");
    printf "%.dMiB (%d%%),%dC,%.2d%%", a[1],a[1]/a[2]*100,a[3],a[4]
    }'
