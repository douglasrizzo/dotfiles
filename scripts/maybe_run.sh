pidof ${2:-$1}
r=$?

case $r in
0)
    dunstify "${2:-$1} already running!"
    ;;
1)
    dunstify "launching $1..." && $1 || "command $1 failed"
    ;;
esac
