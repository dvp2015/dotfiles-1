#!/usr/bin/env bash

# convenience aliases for editing configs
alias ea='vim ~/dotfiles/windows/bash.d/alias.sh'
alias ev='vim ~/dotfiles/.vimrc'
alias eb='vim ~/dotfiles/windows/bashrc'


# Aliases for "colorized" commands
alias l='ls -s --color'
alias ls='ls -s --color'
alias ll='ls -l --color'
alias la='ls -sa --color'
alias lla='ll -la --color'
alias grep='grep -n --color'

# files/directories handling
alias rm='rm -i'
alias md='mkdir -p'
alias '..'='cd ..'
alias '...'='cd ../..'

function 2dir() {
	[ "$(pwd)" != "$1" ] && pushd "$1" >/dev/null
}
export -f 2dir

alias 2ne='2dir "/c/dev/python/triniti_ne"'

# Aliases for git as in zsh
alias g='git'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
alias gcam='git commit -am'

alias 2misc='cd ~/misc'
alias ek='vim ~/misc/keys/generic.txt'

alias path='echo -e ${PATH//:/\\n}'

alias todo='~/misc/todo/todo.sh'
alias etodo='vim ~/misc/todo/todo.txt'
