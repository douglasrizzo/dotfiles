#!/bin/sh

nvidia-smi --query-gpu memory.used,memory.total,temperature.gpu,utilization.gpu,pstate --format=csv,noheader,nounits -i 0 | awk '{
    split($0,a,", ");
    printf "%s %.d/%.dMiB (%.1f%%), %.d C, %.d%%", a[5],a[1],a[2],a[1]/a[2]*100,a[3],a[4]
    }'
