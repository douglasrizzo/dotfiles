#!/bin/sh

start_pm() {
    if type pamac | grep 'pamac is'; then
        notify-send 'Starting pamac'
        pamac
    elif type octopi | grep 'octopi is'; then
        notify-send 'Starting octopi'
        octopi
    else
        notify-send 'No package manager found (pamac or octopi)'
    fi
}

main(){
    if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
        updates_arch=0
    fi

    if ! updates_aur=$(yay -Qum | wc -l); then
    # if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
    # if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
        updates_aur=0
    fi

    updates=$(("$updates_arch" + "$updates_aur"))

    if [ "$updates" -gt 0 ]; then
        echo " $updates"
    else
        echo ""
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
