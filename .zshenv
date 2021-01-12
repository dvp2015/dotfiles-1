# Via https://tanguy.ortolo.eu/blog/article25/shrc
#
# Zsh always executes zshenv. Then, depending on the case:
# - run as a login shell, it executes zprofile;
# - run as an interactive, it executes zshrc;
# - run as a login shell, it executes zlogin.
#
# At the end of a login session, it executes zlogout, but in reverse order, the
# user-specific file first, then the system-wide one, constituting a chiasmus
# with the zlogin files.

skip_global_compinit=1

##
## Paths
##
typeset -gU cdpath fpath mailpath manpath
typeset -gU  path
typeset -gUT INFOPATH infopath
typeset -gUT INCLUDE_PATH include_path
typeset -gUT LIBRARY_PATH library_path
typeset -gUT LD_LIBRARY_PATH ld_library_path
typeset -gUT PKG_CONFIG_PATH pkg_config_path
typeset -gUT CPATH cpath
typeset -gUT C_INCLUDE_PATH c_include_path
typeset -gUT CPLUS_INCLUDE_PATH cplus_include_path
typeset -gUT OBJC_INCLUDE_PATH objc_include_path


cdpath=(
  $HOME/dev
  /opt
  $cdpath
)

infopath=(
  $HOME/.local/share/info
  /usr/local/share/info
  /usr/share/info
  $infopath
)

manpath=(
  $HOME/.local/share/man
  /usr/local/share/man
  /usr/share/man
  $manpath
)

export GOPATH=$HOME/.go

path=(
  $path
  $HOME/bin
  $HOME/.local/bin
  /home/dvp/dev/ipython-latex
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  /usr/local/go/bin
  $GOPATH/bin
)

