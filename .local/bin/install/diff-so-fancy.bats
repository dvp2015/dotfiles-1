#!/usr/bin/env bats

load $BATS_ROOT/bats-support/load.bash
load $BATS_ROOT/bats-assert/load.bash
load $BATS_ROOT/bats-file/load.bash

@test "My file exists" {
    assert_not_exist "xxx"
}
