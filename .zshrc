#
# Original:
# https://github.com/dreamsofautonomy/zensh/blob/main/.zshrc
#
# Check examples and borrow findings
# https://www.joshuad.net/zshrc-config/  (2016)


# Load completions
autoload -Uz compinit && compinit

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

# Load completions
autoload -Uz compinit && compinit

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

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# TODO: revise fzf completion plugins:
# https://github.com/chitoku-k/fzf-zsh-completions?tab=readme-ov-file
# https://github.com/Aloxaf/fzf-tab
zinit light Aloxaf/fzf-tab
# https://github.com/yuki-yano/zeno.zsh
zinit ice lucid depth"1" blockf
zinit light yuki-yano/zeno.zsh
#

# Add in snippets
zinit snippet OMZP::colorize
zinit snippet OMZP::git
# zinit snippet OMZP::gitfast
zinit snippet OMZP::git-extras
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found


# ZSH_WEB_SEARCH_ENGINES=(
#     yandex "https://yandex.ru/search/?text="
# )
# zinit snippet OMZP::web-search
# zinit snippet OMZP::poetry

# zinit snippet OMZP::python
# zinit snippet OMZP::ripgrep
zinit snippet OMZP::ssh-agent
zinit cdreplay -q

#use with C-O, C-J or command 'ziconsole'
# zinit wait lucid for zinit-zsh/zinit-console
# requires authentification on github by password, but that is prohibited since
# 2021

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

#colorize
ZSH_COLORIZE_CHROMA_FORMATTER=terminal256
ZSH_COLORIZE_STYLE="paraiso-dark"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HIST_STAMPS="yyyy-mm-dd"
export HISTORY_IGNORE="(&|[bf]g|ll|ls|lm|lk|l|la|lt|h|history|ev|ea|ek|exit|id|uptime|resize|clear|mc|cs|cd ..|ez|...|....)"

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

export BROWSER=yandex-browser

# open file with a default associated program
function o() {
  if [[ -n "$BROWSER" && "$1" = (http|https)://* ]]; then
    "$BROWSER" "$@"
    return
  fi
  local open_cmd='nohup xdg-open'
  ${=open_cmd} "$@" &>/dev/null
}


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'

if [[ -x rg ]]; then
  export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
elif [[ -x ag ]]; then
  export FZF_DEFAULT_COMMAND='ag -l -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
# https://github.com/junegunn/fzf/blob/master/ADVANCED.md#using-fzf-as-interactive-ripgrep-launcher
export FZF_DEFAULT_OPTS="--extended-exact --color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(zoxide init zsh)"

# Thanks to https://github.com/elifarley/shellbase/blob/master/.zshrc
test -r ~/.shell-env && source ~/.shell-env
test -r ~/.shell-common && source ~/.shell-common
test -r ~/.shell-aliases && source ~/.shell-aliases

eval "$(zoxide init zsh)"

# Updating environment

# zinit
function zinitup() {
    echo "zinit update zsh..."
    zinit self-update
    zinit update
}

function allup() {
    pushd $HOME > /dev/null
    zinitup 
    juliaup self update
    juliaup update
    rustup self update
    rustup update
    poetry self update
    popd > /dev/null
}

# Colorize help output with bat
# alias -g -- -h='-h 2>&1 | batcat --language=help --style=plain'
# alias -g -- --help='--help 2>&1 | batcat --language=help --style=plain'

function rgi() {
    # Interactive ripgrep
    # 1. Search for text in files using Ripgrep
    # 2. Interactively restart Ripgrep with reload action
    # 3. Open the file in Vim
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"
    fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --delimiter : \
        --preview 'batcat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(vim {1} +{2})'
}

function rgf() {
    # Switch between Ripgrep mode and fzf filtering mode (CTRL-T)
    rm -f /tmp/rg-fzf-{r,f}
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="${*:-}"
    fzf --ansi --disabled --query "$INITIAL_QUERY" \
        --bind "start:reload:$RG_PREFIX {q}" \
        --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
        --bind 'ctrl-t:transform:[[ ! $FZF_PROMPT =~ ripgrep ]] &&
          echo "rebind(change)+change-prompt(1. ripgrep> )+disable-search+transform-query:echo \{q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r" ||
          echo "unbind(change)+change-prompt(2. fzf> )+enable-search+transform-query:echo \{q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f"' \
        --color "hl:-1:underline,hl+:-1:underline:reverse" \
        --prompt '1. ripgrep> ' \
        --delimiter : \
        --header 'CTRL-T: Switch between ripgrep/fzf' \
        --preview 'bat --color=always {1} --highlight-line {2}' \
        --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
        --bind 'enter:become(vim {1} +{2})'    
}

[[ ! -f ~/.uv-completions ]] || source ~/.uv-completions
[[ ! -f ~/.just-completions ]] || source ~/.just-completions

# moved to ~/bin/mamba.rc
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/dvp/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/dvp/miniforge3/etc/profile.d/conda.sh" ]; then
#         . "/home/dvp/miniforge3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/dvp/miniforge3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
#
# if [ -f "/home/dvp/miniforge3/etc/profile.d/mamba.sh" ]; then
#     . "/home/dvp/miniforge3/etc/profile.d/mamba.sh"
# fi


# TODO: switch to ohmyposh
# https://www.youtube.com/watch?v=9U8LCjuQzdc 
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/dvp/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

# njoy 
export NJOY_INSTALL_DIR="/opt/njoy2016/bin/"
if [[ -d "$NJOY_INSTALL_DIR" ]]; then
    path=("$NJOY_INSTALL_DIR" $path)
fi

# pycharm
if [[ -d /opt/pycharm ]]; then
    export PATH="/opt/pycharm/bin:$PATH"
fi

#  vim: set ts=4 sw=0 tw=79 ss=0 ft=zsh et ai :
