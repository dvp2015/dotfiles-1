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

alias mkdir -p'
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

# Различные варианты 'ls' (предполагается, что установлена GNU-версия ls)
# alias l='ls'                    # короче
# alias la='ls -Al'               # показать скрытые файлы
alias ls='ls -hF --color=always --group-directories-first'       # выделить различные типы файлов цветом
alias lx='ls -lXB --color=always --group-directories-first'      # сортировка по расширению
alias lk='ls -lSr --color=always --group-directories-first'      # сортировка по размеру
alias lc='ls -lcr --color=always --group-directories-first'      # сортировка по времени изменения
alias lu='ls -lur --color=always --group-directories-first'      # сортировка по времени последнего обращения
alias lr='ls -lR --color=always --group-directories-first'       # рекурсивный обход подкаталогов
alias lt='ls -ltr --color=always --group-directories-first'      # сортировка по дате
alias lm='ls -al --color=always --group-directories-first |more' # вывод через 'more'

function lss () { 
    ls -FaGl "${@}" | awk '{ total += $4; print }; END { print total }'; 
}

#Using clipboard
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# Return if requirements are not found.
alias todo='~/misc/todo/todo.sh'
alias todol="todo ls -someday"
alias etodo="vim ~/misc/todo/todo.txt"

alias ek="vim ~/misc/keys/generic.txt"

# Chrome
alias chrome='/opt/google/chrome/chrome'

# Jupyter
alias jn='jupyter notebook'

# yEd
# https://www.yworks.com
alias yed='java -jar /opt/java/extensions/yed-3.18.1/yed.jar'

