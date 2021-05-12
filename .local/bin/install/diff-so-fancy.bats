#!/usr/bin/env bats

# "unofficial" bash strict mode
# See: http://redsymbol.net/articles/unofficial-bash-strict-mode
# set -o errexit  # Exit when simple command fails               'set -e'
# set -o errtrace # Exit on error inside any functions or subshells.
set -o nounset  # Trigger error when expanding unset variables 'set -u'
# set -o pipefail # Do not hide errors within pipes              'set -o pipefail'
# set -o xtrace   # Display expanded command and arguments       'set -x'

load $BATS_ROOT/lib/bats-support/load.bash
load $BATS_ROOT/lib/bats-assert/load.bash
load $BATS_ROOT/lib/bats-file/load.bash

setup() {
  export _git_dir="${BATS_TMPDIR}/diff-so-fancy.git"
  export _out_dir="${BATS_TMPDIR}/diff_so_fancy.out"
  rm -rf "${_git_dir}" "${_out_dir}"
}

main() {
   bash diff-so-fancy "$@"
}

@test "install_diff_so_fancy creates install directory" {
    mkdir -p $_out_dir/bin
    assert_dir_not_exist $_out_dir/lib
    run main $_out_dir $_git_dir
    assert_file_exist $_out_dir/bin/diff-so-fancy
    assert_dir_exist $_out_dir/lib
    run $_out_dir/diff-so-fancy --version 
}

@test "install_diff_so_fancy should fail if out dir doesn't exist" {
    assert_dir_not_exist $_out_dir/bin
    assert_dir_not_exist $_out_dir/lib
    run main $_out_dir $_git_dir
    assert_failure
}
