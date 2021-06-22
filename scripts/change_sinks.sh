if pacmd list-sinks | grep -e '  index:'; then
  pacmd list-sinks | grep -e '  index:' | awk -F'index:' '{for (i=2; i<=NF; i++) printf("%s", $i)}' | xargs pacmd set-default-sink
elif pacmd list-sinks | grep -e 'active port: <analog-output-speaker>'; then
  pacmd set-sink-port 0 analog-output-headphones
else
  pacmd set-sink-port 0 analog-output-speaker
fi
