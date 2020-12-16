#!/usr/bin/env bats

load $BATS_ROOT/bats-support/load.bash
load $BATS_ROOT/bats-assert/load.bash
load $BATS_ROOT/bats-file/load.bash

. ./diff-so-fancy

@test "install_diff_so_fancy creates install directory" {
    run install_diff_so_fancy
    assert_dir_exist $HOME/Downloads/install/diff-so-fancy
    run diff-so-fancy >&2
}
