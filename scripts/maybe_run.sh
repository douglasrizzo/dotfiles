pidof ${2:-$1}
r=$?

case $r in
0)
    notify-send "${2:-$1} already running!"
    ;;
1)
    notify-send "launching $1..." && $1 || "command $1 failed"
    ;;
esac
