pacmd list-sinks | grep -e '  index:' | awk -F'index:' '{for (i=2; i<=NF; i++) printf("%s", $i)}' | xargs pacmd set-default-sink
