ANSWER=$(zenity --list --title="Keyboard Layout" --text "Pick keyboard layout below" --radiolist --column "" --column "Layout" TRUE "QWERTY ABNT-2" FALSE "Dvorak right-handed" FALSE "Dvorak")

case $ANSWER in
"QWERTY ABNT-2")
    notify-send $ANSWER && setxkbmap -layout br -variant abnt2
    ;;
"Dvorak right-handed")
    notify-send $ANSWER && setxkbmap -layout br -variant dvorak
    ;;
"Dvorak")
    notify-send $ANSWER && setxkbmap -layout us -variant dvorak-r
    ;;
*)
    notify-send "FUSHURURU"
    ;;
esac
