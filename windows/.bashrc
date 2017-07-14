#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

function get_hostname {
  export SHORTNAME=${HOSTNAME}
}

function user_color {
  id | grep "Admin" > /dev/null
  RETVAL=$?
  if [[ $RETVAL == 0 ]]; then
    usercolor="[0;32m";
  else
    usercolor="[0;32m";
  fi
}

function settitle() {
  u=${USERNAME}
  h="$u@${HOSTNAME}"
  echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
inputcolor='[0;37m'
cwdcolor='[0;34m'
host_name='[1;31m'
git_color='[0;33m'
user_color
PROMPT_COMMAND='settitle; get_hostname; history -a;'
export PS1='\n\[\e${cwdcolor}\][$PWD]\n\[\e${usercolor}\][\u]\[\e${host_name}\][${SHORTNAME}]\[\e${git_color}\]`__git_ps1`\[\e${inputcolor}\]\n$ '

# Aliases for "colorized" commands
alias ls='ls -s --color'
alias ll='ls -l --color'

alias grep='grep -n --color'
export EDITOR="vim"
export MY_ORIGINAL_PATH=$PATH
export PATH="~/bin:$PATH"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi 

for p in ~/.bash.d/*.sh; do
	. $p
done

# Load local bash session configuration files (order of loading is arbitrary)
if [[ $(pwd) != ~ && -d ".bash.d" ]]; then
	for p in .bash.d/*.sh; do
		. $p
	done
fi
	
# Add local "bin" folder to the PATH, if exists
if [[ $(pwd) != ~ && -d "bin" ]]; then
	export PATH="$PATH:$(pwd)/bin"
fi