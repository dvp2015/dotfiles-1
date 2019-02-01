if [[ -x "/usr/bin/mc" ]]; then
    actual_mc="/usr/bin/mc"
elif [[ -x "/usr/local/bin/mc" ]]; then
    actual_mc="/usr/local/bin/mc"
else
    echo "Cannot find Midnight Comander executable 'mc'"
fi

if [[ -n "$actual_mc" ]]; then
    MC_USER=`id | sed 's/[^(]*(//;s/).*//'`
    MC_PWD_FILE="${TMPDIR-/tmp}/mc-$MC_USER/mc.pwd.$$"

    # There are some problems when running MC on ZSH.
    # see https://midnight-commander.org/ticket/2072
    # Note: The problem doesn't show when running MC as a root.
    # TODO: find the fix to allow subshell in ZSH.
    if [[ -n "$ZSH_VERSION" ]]; then
        run_without_subshell="-u"
    fi

    "$actual_mc" "$run_without_subshell" -P "$MC_PWD_FILE" "$@"
    unset actual_mc
    unset run_without_subshell

    if test -r "$MC_PWD_FILE"; then
        MC_PWD="`cat "$MC_PWD_FILE"`"
        if test -n "$MC_PWD" && test -d "$MC_PWD"; then
            cd "$MC_PWD"
        fi
        unset MC_PWD
    fi

    rm -f "$MC_PWD_FILE"
    unset MC_PWD_FILE
    unset MC_USER
fi
