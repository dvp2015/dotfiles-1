# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

add_source() {
    for f in "$[@]"; do
        [ -f "$f" ] && source "$f"
    done
}

insert_path() {
    for f in "$[@]"; do
        [ -d "$f" ] && PATH="$f:$PATH"
    done
}

# if running bash
[ -n "$BASH_VERSION" ] && add_source "$HOME/.bashrc"

add_path "$HOME/bin" "$HOME/.local/bin"

add_source "$HOME/.cargo/env"

export GOPATH=$HOME/.go
insert_path "/usr/local/go/bin" "$GOPATH/bin"

unalias vim

add_source /sharedfolder/common/profile
