# aliases for Tmux
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# convenience aliases for editing configs
alias ev='vim ~/dotfiles/vimrc'
alias et='vim ~/dotfiles/tmux.conf'
alias ea='vim ~/dotfiles/zsh/custom/alias.zsh'
alias ep='vim ~/dotfiles/zsh/custom/path.zsh'
alias eu='vim ~/dotfiles/zsh/custom/utils.zsh'
alias ez='vim ~/.zshrc'
alias eomz="vim ~/.oh-my-zsh/oh-my-zsh.sh"

# running vim with "factory settings", see "Practical Vim"
alias vimc='vim -u ~/.vim/essential.vim'

# full proof
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# navigation
alias ne='~/dev/python/triniti_ne'
alias mcc='ssh dvpab@ui2.computing.kiae.ru'
alias cs='ssh dvp@gitlab.iterrf.ru'

alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias r='rlogin'
alias path='echo -e ${PATH//:/\\n}'
alias du='du -kh'
alias df='df -kTh'

# Различные варианты 'ls' (предполагается, что установлена GNU-версия ls)
# alias l='ls'                    # короче
# alias la='ls -Al'               # показать скрытые файлы
alias ls='ls -hF --color'       # выделить различные типы файлов цветом
alias lx='ls -lXB'              # сортировка по расширению
alias lk='ls -lSr'              # сортировка по размеру
alias lc='ls -lcr'              # сортировка по времени изменения
alias lu='ls -lur'              # сортировка по времени последнего обращения
alias lr='ls -lR'               # рекурсивный обход подкаталогов
alias lt='ls -ltr'              # сортировка по дате
alias lm='ls -al |more'         # вывод через 'more'
alias tree='tree -Csu'          # альтернатива 'ls'

#Using clipboard
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"

# Return if requirements are not found.
if (( $+commands[todo.sh] )); then
  alias todo='todo.sh'
  alias todol="todo.sh ls -someday"
  alias etodo="vim ~/misc/todo/todo.txt"
fi

alias ek="vim ~/misc/keys/generic.txt"

# Chrome
alias chrome='/opt/google/chrome/chrome'

# Jupyter
alias jn='jupyter notebook'
