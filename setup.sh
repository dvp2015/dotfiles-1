#!/bin/bash

home=~
machine="$TARGET_MACHINE"
machine="${machine:-$(uname -n)}"
backup_dir="${home}/bak"
mkdir -p "$backup_dir"

echo "Installing dotfiles for machine $machine"

backup() {
    local name="$1"
    if [[ -e "$name" ]]; then
        if [[ -L "$name" ]]
        then
            rm -f "$name" && echo "Symbolik link $name is removed"
        else
            mv "$name" "$backup_dir" && echo "File $name is saved in backup folder $backup_dir"
        fi
        if [[ "0" != "$?" ]]; then
            echo "Failed to backup $name"
            return 1
        fi
    fi
}

set_link() {
    local name="$1"
    local target="${home}/.${name}"
    backup "$target" &&  ln -v -s "${home}/dotfiles/${name}" "${target}" || \
        echo "Failed to create link for ${name}"
}

files="gitignore gitconfig"
files="$files bash_logout bash_profile profile shell-aliases"
files="$files shell-common shell-env shell-logout"
files="$files bashrc dircolors"
files="$files vimrc ctags"
files="$files zhrc  zshenv"


for f in ${files} ; do
    set_link $f
done
