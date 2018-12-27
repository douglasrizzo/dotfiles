export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# adding TensorFlow models directory to our path
export PYTHONPATH=$PYTHONPATH:/home/dodo/Code/models/research:/home/dodo/Code/models/research/slim

# StarCraft 2 path, used by pysc2
export SC2PATH="/opt/StarCraftII"

export PATH="/home/dodo/.anaconda3/bin:$PATH"

export PATH="/home/dodo/.texlive/2018/bin/x86_64-linux:$PATH"
export MANPATH="/home/dodo/.texlive/2018/texmf-dist/doc/man:$MANPATH"
export INFOPATH="/home/dodo/.texlive/2018/texmf-dist/doc/info:$INFOPATH"

# variables necessary by Malmo and MarLo
# export MALMO_MINECRAFT_ROOT=/home/dodo/MalmoPlatform/Minecraft
# export MALMO_XSD_PATH=/home/dodo/MalmoPlatform/Schemas
# this is a nuisance when not using Malmo, so only uncomment it when doing Malmo-related experiments
# export TERM=xterm

PATH="/home/dodo/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dodo/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dodo/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dodo/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dodo/.perl5"; export PERL_MM_OPT;