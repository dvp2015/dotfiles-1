# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac
[ -z "$PS1" ] && return

# Source global definitions
test -r /etc/bash.bashrc && source /etc/bash.bashrc

test -r ~/.shell-env  && source ~/.shell-env
test -r ~/.shell-common  && source ~/.shell-common
test -r ~/.shell-aliases && source ~/.shell-aliases

# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Store multiline commands as one line.
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Spellcheck directories
shopt -s dirspell

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm) color_prompt=yes;;
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
    screen) color_prompt=yes;;
esac


# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm, then set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
test -f /usr/share/bash-completion/bash_completion && source /usr/share/bash-completion/bash_completion
test -f /etc/bash_completion && source /etc/bash_completion

test -r ~/.bashrc.local && source ~/.bashrc.local



[ -f ~/.fzf.bash ] && source ~/.fzf.bash


if [[ -x python ]]; then

    GITHUB="https://github.com"

    [[ -z "$PYENV_ROOT" ]] && export PYENV_ROOT="$HOME/.pyenv"

    # TODO update for pyenv-win

    _pyenv_install() {
        echo "Installing pyenv..."
        git clone "${GITHUB}/pyenv/pyenv.git"            "${PYENV_ROOT}"
        git clone "${GITHUB}/pyenv/pyenv-doctor.git"     "${PYENV_ROOT}/plugins/pyenv-doctor"
        git clone "${GITHUB}/pyenv/pyenv-installer.git"  "${PYENV_ROOT}/plugins/pyenv-installer"
        git clone "${GITHUB}/pyenv/pyenv-update.git"     "${PYENV_ROOT}/plugins/pyenv-update"
        git clone "${GITHUB}/pyenv/pyenv-virtualenv.git" "${PYENV_ROOT}/plugins/pyenv-virtualenv"
        git clone "${GITHUB}/pyenv/pyenv-which-ext.git"  "${PYENV_ROOT}/plugins/pyenv-which-ext"
    }

    _pyenv_load() {
        # export PATH
        export PATH="$PYENV_ROOT/bin:$PATH"

        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    }
    # install pyenv if it is not already installed
    #    [[ ! -f "$PYENV_ROOT/libexec/pyenv" ]] && _pyenv_install

    # load pyenv if it is installed
    # if [[ -f "$PYENV_ROOT/libexec/pyenv" ]]; then
    # _pyenv_load
    # fi
fi

[[ -x direnv ]] && eval "$(direnv hook bash)"

# echo ".bashrc is loaded"
#  vim: set ts=4 sw=0 tw=79 ss=0 ft=sh et ai :
