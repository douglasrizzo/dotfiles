#!/bin/sh

start_pm() {
    if type octopi | grep 'octopi is'; then
        notify-send 'Starting octopi'
        octopi
    elif type pamac-manager | grep 'pamac-manager is'; then
        notify-send 'Starting pamac'
        pamac-manager
    else
        notify-send 'No package manager found (octopi or pamac)'
    fi
}

main() {
    if ! updates_arch=$(checkupdates 2>/dev/null | wc -l); then
        updates_arch=0
    fi

    if ! updates_aur=$(yay -Qum 2>/dev/null | wc -l); then
        updates_aur=0
    fi

    updates=$(("$updates_arch" + "$updates_aur"))

    if [ $updates -gt 0 ]; then
        echo " $updates_arch/$updates_aur"
    fi
}

case "$1" in
--gui)
    start_pm
    ;;
*)
    main
    ;;
esac
