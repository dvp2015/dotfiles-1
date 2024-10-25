# Via https://tanguy.ortolo.eu/blog/article25/shrc
#
# At startup, depending on the case:
# - run as a login shell (or with the option --login), it executes profile (or
# bash_profile instead if it exists (only user-specific version));
# - run as an interactive, non-login shell, it executes bashrc (the system-wide
# version is called bash.bashrc).
#
# At exit, it executes ~/.bash_logout (the system-wide version is called
# bash.bash_logout).
# Note the funny (read: insane) non-login condition for executing bashrc: it is
# often worked around by having the profile execute bashrc anyway.

[[ -f $HOME/.profile ]] && source $HOME/.profile
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/dvp/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/dvp/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<
