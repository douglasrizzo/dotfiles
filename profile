export ZDOTDIR="$HOME/.config/zsh"

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/home/dodo/.local/bin/mk
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# StarCraft 2 path, used by pysc2
export SC2PATH="/opt/StarCraftII"
export MICRORTSPATH="$HOME/Code/microrts/bin/microrts.jar"

export PATH="$HOME/.anaconda3/bin:$PATH"
export PATH="$HOME/.texlive/2020/bin/x86_64-linux:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
export MANPATH="$HOME/.texlive/2020/texmf-dist/doc/man:$MANPATH"
export INFOPATH="$HOME/.texlive/2020/texmf-dist/doc/info:$INFOPATH"

#this is supposed to fix Java GUI applications in bspwm
export _JAVA_AWT_WM_NONREPARENTING=1
#this fixes jagged fonts in Java software such as Chatty
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'

export PATH="/opt/cuda-10.1/bin:$PATH"
export CPATH="/opt/cuda-10.1/include:$CPATH"
export LD_LIBRARY_PATH="/usr/lib:/home/dodo/.anaconda3/lib:/opt/cuda-10.1/lib64:/opt/cuda-10.1/lib:/opt/TensorRT-6.0.1.5/lib"

# variables necessary by Malmo and MarLo
# export MALMO_MINECRAFT_ROOT=$HOME/MalmoPlatform/Minecraft
# export MALMO_XSD_PATH=$HOME/MalmoPlatform/Schemas
# this is a nuisance when not using Malmo, so only uncomment it when doing Malmo-related experiments
# export TERM=xterm

export PATH="$PATH:$HOME/.perl5/bin"
export PERL5LIB="$HOME/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="$HOME/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"$HOME/.perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"

export TERMINAL="alacritty"
