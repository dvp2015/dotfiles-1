#!/usr/bin/env zsh
#-----------------------------------
# Функции для работы с файлами и строками:
#-----------------------------------

# Поиск файла по шаблону:
function ff() { find . -type f -iname '*'$*'*' -ls ; }
# Поиск файла по шаблону в $1 и запуск команды в $2 с ним:
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }
# поиск строки по файлам:
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: поиск строки в файлах.
Порядок использования: fstr [-i] \"шаблон\" [\"шаблон_имени_файла\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -Hsn --color ${case} "$1"
}
# удалить последние n строк в файле, по-умолчанию 10
function cuttail() 
{
    nlines=${2:-10}
    sed -n -e :a -e "1,${nlines}!{P;N;D;};N;ba" $1
}

# The script provides frequently changed stuff in the development phase to be distributed over other machines and to be include to .bashrc
function add_to_path() {
  t=$PATH
  for p in $*
  do
    if [[ "$t" == "${t/$p//}" ]]; then
      if [[ -d "$p" ]]; then
        t=$p:$t
      else
        echo "ERROR| add_to_path| Path \"$p\" doesn't exist"
        return 1
      fi
    fi
  done
  if [[ "$t" != "$PATH" ]]; then
    export PATH=$t
  fi
}

# useful to generate inclusion marking variables for environment scripts
function generate_guid_variable_name() {
  prefix=${1:-\_}
  echo $prefix$(uuidgen) | sed 's/-/_/g'
}

# Searches the first readable file over folder hierarchy, starting from the current directory
# Arguments:
#    $1 - file to seaarch
#    $2 - path to start search from (optional, default current dir)
# Output on success: the full path to the found file
# Returns 0 on success, 1 if the file not found
# Exits if the file is not specified in arguments.
function search_file_upward() {
  if [[ $# < 1 ]]; then
    echo "ERROR: include_env| Reference to the environment file is not provided"
    exit 10
  fi
  local d=${2:-$(pwd)}
  while [[ "$d" != "/" ]]
  do
    fn=$(readlink -f $d/$1)
    if [[ -r $fn  ]]; then
      echo $fn
      return 0
    fi
    d=$(dirname $d)
  done
  return 1 #no .mcc_env files were found in the folders hierarchy
}



function include_env() {

  if [[ $# < 1 ]]; then
    echo "ERROR: include_env| Reference to the environment file is not provided"
    exit 10
  fi

  if [[ -r $1 ]]; then
    . $fn
    return 0
  else
    # echo "ERROR| include_env| file "$1" doesn't exist"
    return 1
  fi
}


# Creates environment variable with name $1 pointing to directory $2. The directory is created if abssent
function setup_name_and_dir() {
  if [[ ! -v $1 ]]; then
    declare -gxr $1=$2
    if [[ ! -d $2 ]]; then
      mkdir -p $2
    fi
  fi
}



if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s     # сделает наш день более интересным.... :-)
fi

function rvm-prompt() {
	which python
}
