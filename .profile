# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

add_source() {
    for f in "$@"; do
        [ -f "$f" ] && source "$f" || echo "ERROR: $f is not a file" && return 1
    done
}

insert_path() {
    for f in "$@"; do
        [ -d "$f" ] && PATH="$f:$PATH" || echo "ERROR: $f is not a directory" && return 1
    done
}

[ -n "$BASH_VERSION" ] && . "$HOME/.bashrc"
insert_path "$HOME/bin" "$HOME/.local/bin"
add_source "$HOME/.cargo/env"

if [[ "$HOST" == "hpc-node-01" ]]; then
        . /sharedfolder/common/.profile
        module add Python/3.10.8
else
    export GOPATH=$HOME/.go
    insert_path "/usr/local/go/bin" "$GOPATH/bin"
fi

export PATH

# vim: set ts=4 sw=4 tw=100 ft=sh ss=0 et ai :
