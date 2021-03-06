#  vim: set ts=4 sw=0 tw=79 ss=0 ft=zsh et ai :
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Via https://tanguy.ortolo.eu/blog/article25/shrc
#
# Zsh always executes zshenv. Then, depending on the case:
# - run as a login shell, it executes zprofile;
# - run as an interactive, it executes zshrc;
# - run as a login shell, it executes zlogin.
#
# At the end of a login session, it executes zlogout, but in reverse order, the
# user-specific file first, then the system-wide one, constituting a chiasmus
# with the zlogin files.

# Thanks to https://github.com/elifarley/shellbase/blob/master/.zshrc
test -r ~/.shell-env && source ~/.shell-env
test -r ~/.shell-common && source ~/.shell-common
test -r ~/.shell-aliases && source ~/.shell-aliases

fpath=(/usr/share/zsh/vendor-completions/ $fpath)
fpath=($HOME/.local/zsh.completions $fpath)

# To activate completions for zsh you need to have
# bashcompinit enabled in zsh:
autoload -U bashcompinit
bashcompinit

if [[ -e "register-python-argcomplete" ]]; then
    # Enable completion for nox:
    eval "$(register-python-argcomplete nox)"
fi

# Add file manager functions to shell
# http://www.bash2zsh.com/essays/essay1_file_manager.html
zstyle :mime: mailcap ~/.mailcap /usr/local/etc/mailcap /etc/mailcap
zstyle :mime: mime-types ~/.mime.types /usr/local/etc/mime.types /etc/mime.types
autoload -U zsh-mime-setup
zsh-mime-setup
# ... to open HTML files in proper browser
autoload -U pick-web-browser
zstyle ':mime:.htm(|l):' handler 'pick-web-browser %s'
zstyle ':mime:.htm(|l):' flags ''

export DEFAULT_USER=dvp
TERM=xterm-256color

# Enable zplug
# See http://codegist.net/snippet/shell/zshrc_cnsworder_shell and http://codegist.net/search/zplug-vs-antigen/5
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update
fi

export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/zsh/custom
source $ZSH/oh-my-zsh.sh

# TODO stop using plugin manager, update ohmyzsh

# Essential
source ~/.zplug/init.zsh

# https://github.com/zplug/zplug/issues/419
# alias -g zplug="LC_MESSAGES=en_US.UTF-8 zplug"

# Make sure to use double quotes to prevent shell expansion
zplug "zplug/zplug", hook-build:"zplug --self-manage"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/ssh-agent", from:oh-my-zsh, ignore:oh-my-zsh.sh
# Load after ssh-agent
zplug "plugins/gpg-agent", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "plugins/sudo", from:oh-my-zsh, ignore:oh-my-zsh.sh
zplug "djui/alias-tips"
zplug "willghatch/zsh-snippets"
zplug "supercrabtree/k"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitfast", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/poetry", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
# zplug "plugins/pylint", from:oh-my-zsh
# zplug "plugins/tmux", from:oh-my-zsh
# zplug "plugins/tmuxinator", from:oh-my-zsh
# zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "mattberther/zsh-pyenv"
# zplug "zlsun/solarized-man"
zplug "joel-porquet/zsh-dircolors-solarized"
# zplug "marzocchi/zsh-notify", use:"notify.plugin.zsh"
# zplug 'molovo/revolver', as:command, use:revolver
# zplug 'zunit-zsh/zunit', as:command, use:zunit, hook-build:'./build.zsh'
ZSH_THEME="powerlevel10k/powerleve10k"
zplug romkatv/powerlevel10k, as:theme, depth:1

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install zsh plugins? [y/n]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load # --verbose

bindkey '^j' snippet-expand

function zplugup() {
    echo "zplug update zsh..."
    zplug update
}

function vimup() {
    echo "vim-plug update..."
    vim +PlugUpdate +qall
}

function pyenvup() {
    echo "pyenv update..."
    pyenv update
}

function allup() {
    zplugup 
    vimup 
    pyenvup 
}


# Path to your oh-my-zsh installation.
# export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="fino-time"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HIST_STAMPS="yyyy-mm-dd"
export HISTORY_IGNORE="(&|[bf]g|ll|ls|lm|lk|l|la|lt|h|history|ev|ea|ek|exit|id|uptime|resize|clear|mc|cs|cd ..|ez|...|....)"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git gitfast git-extras python pylint tmux tmuxinator)
# source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='gvim'
# fi
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"


# From: https://www.codementor.io/linux/tutorial/configure-linux-toolset-zsh-tmux-vim


# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

# make sure that if a program wants you to edit
# text, that Vim is going to be there for you
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR


# This forces julia PyCall and IJulia to use "standard" python and jupyter
export PYTHON="/opt/anaconda3/bin/python"
export JUPYTER="/opt/anaconda3/bin/jupyter"

# open file with a default assiciated program
function o() {
  for i in "$@"
  do
    xdg-open $i
  done
}

USE_TMUX="no" # DVP: while I don't use tmux

if [[ "yes" == "$USE_TMUX" ]]; then
    #                                          --- tmux
    if [[ ! -d ~/.tmux/plugins/tpm ]]; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    # Teleconsole does not preserve TMUX env variable
    if [[ -z "$TMUX" ]] && [[ -z "$TELEPORT_SESSION" ]]; then
        # Attempt to discover a detached session and attach it, else create a new
        # session
        CURRENT_USER=$(whoami)
        if tmux has-session -t $CURRENT_USER 2>/dev/null; then
            tmux attach-session -t $CURRENT_USER
        else
            tmux new-session -s $CURRENT_USER
        fi
    fi
fi

lg() {
    export LAZYGIT_NEW_DIR_FILE=~/.lazygit/newdir

    lazygit "$@"

    if [ -f $LAZYGIT_NEW_DIR_FILE ]; then
        cd "$(cat $LAZYGIT_NEW_DIR_FILE)"
        rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
    fi
}

if [[ -x rg ]]; then
    export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
elif [[ -x ag ]]; then
    export FZF_DEFAULT_COMMAND='ag -l -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
export FZF_DEFAULT_OPTS="--extended-exact"


[ -f ~/.bin/tmuxinator.zsh ] && source ~/.bin/tmuxinator.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.local/build.zsh ] && source ~/.local/build.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(direnv hook zsh)"
eval "$(jump shell zsh)"

#  vim: set ts=4 sw=0 tw=79 ss=0 ft=zsh et ai :
