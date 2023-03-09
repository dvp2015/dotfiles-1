



# Added by Toolbox App
export PATH="$PATH:/home/dvp/.local/share/JetBrains/Toolbox/scripts"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion /home/dvp/.pyenv/versions/r2s/bin/python -m pip
# pip zsh completion end

unalias vim
[ -f /sharedfolder/common/.profile ] && . /sharedfolder/common/.profile
