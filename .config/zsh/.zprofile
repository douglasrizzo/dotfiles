#!/usr/bin/env sh
PRIVATE_PROFILE="$HOME/Documents/profile_private.sh"
[ -f "$PRIVATE_PROFILE" ] && source "$PRIVATE_PROFILE"


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"