#!/usr/bin/env zsh
export PATH_BEFORE_CUSTOM=$PATH
export PATH="/opt/anaconda3/bin:$PATH"
export PATH="~/bin:/opt/bin:$PATH"
export PATH=$PATH:/opt/bin    #adding executables folder shared between users
export MCNP_HOME=${MCNP_HOME:-/opt/lanl}
export MCNP_DATA=$MCNP_HOME/MCNP_DATA
export DATAPATH=$MCNP_DATA
export MCNP_DEFAULT_XSDIR=$DATAPATH/xsdir
export MCNP_PATH="${MCNP_HOME}/MCNP5/bin:${MCNP_HOME}/bin"
export PATH=$PATH:${MCNP_HOME}/MCNP5/bin
export TRIPOLI_HOME=/opt/tripoli
export PATH=$PATH:$TRIPOLI_HOME/bin
export PATH=$PATH:/opt/pycharm-community-2017.1.2/bin
export PATH=$PATH:~/misc/todo
path=($HOME/dotfiles/bash/bin $path)
path=($HOME/lib/boost/1.66/bin $path)
path=(/opt/JuliaPro-0.6.1.1 $path)
