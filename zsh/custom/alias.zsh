# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# convenience aliases for editing configs
alias ev='vim ~/dotfiles/.vimrc'
alias et='vim ~/dotfiles/tmux.conf'
alias ea='vim ~/dotfiles/zsh/custom/alias.zsh'
alias ep='vim ~/dotfiles/zsh/custom/path.zsh'
alias eu='vim ~/dotfiles/zsh/custom/utils.zsh'
alias ez='vim ~/.zshrc'
alias eomz="vim ~/.oh-my-zsh/oh-my-zsh.sh"

# running vim with "factory settings", see "Practical Vim"
alias vimc='vim -u ~/dofiles/vim/essential.vim'

# full proof
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# navigation
alias ne='~/dev/python/triniti_ne'
alias sshmcc='ssh dvpab@ui2.computing.kiae.ru'
alias sshhpc4='ssh dvpab@ui4.computing.kiae.ru'
alias sshapk5='ssh dvp2@apk5.triniti.ru'
alias sshcs='ssh dvp@gitlab.iterrf.ru'
alias misc='~/misc'
alias dotfiles='~/dotfiles'
alias upp='/opt/lanl/wrk/upp'

alias md='mkdir -p'
#
# Creates a given directory (if needed) and changes to it.
#
function mdcd() {
    mkdir -p "$1"  && cd "$1"
}
alias mdcdb='mdcd build'

alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias printpath='echo -e ${PATH//:/\\n}'
alias du='du -kh'
alias df='df -kTh'

