# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export PATH

# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CACHE_HOME="$HOME/.cache"

# export GOPATH="$HOME/Documents/Go"
# export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

# export HISTFILE="$XDG_DATA_HOME/bash/history"
# export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
# export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
# export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
# export IPYTHONDIR="$XDG_CONFIG_HOME/jupyter"
# export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR/tmux"
# export STACK_ROOT="$XDG_DATA_HOME/stack"
# export WEECHAT_HOME="$XDG_CONFIG_HOME/weechat"
# export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
# export WINEPREFIX="$XDG_DATA_HOME/wine/prefixes/default"
# export TMUX_TMPDIR="$XDG_RUNTIME_DIR/tmux"
# export RUST_SRC_PATH="$HOME/.local/src/rust/src"

# # NVIDIA Linux Driver
# export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
# export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
