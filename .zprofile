


if [[ "$HOST" == "hpc-node-01" ]]; then
    export MCNP_VARIANT="MCNP6_2018"
    . /sharedfolder/common/.profile
    module add Python/3.10.8
fi



# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

if [[ -d "$HOME/.local/share/JetBrains/Toolbox/scripts" ]]; then
  # Added by Toolbox App
  export PATH="$PATH:$HOME/dvp/.local/share/JetBrains/Toolbox/scripts"
fi


#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
