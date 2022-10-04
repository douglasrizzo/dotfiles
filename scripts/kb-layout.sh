if setxkbmap -query | grep 'layout:     us'; then
    setxkbmap -model p104 -layout br -variant abnt2 && \
    dunstify -a setxkbmap 'Changing keyboard to ABNT-2' || \
    dunstify -a setxkbmap 'There was a problem changing keyboard mappings!'
else
    setxkbmap -model p104 -layout us -variant intl && \
    dunstify -a setxkbmap 'Changing keyboard to US International' || \
    dunstify -a setxkbmap 'There was a problem changing keyboard mappings!'
fi
