#!/usr/bin/env bats

. ~/.shell-env

tmpdir="."

function setup() {
    tmpdir=$(mktemp -d  "bz-test.XXXXXX")
}

function teardown() {
    rm -fr $tmpdir
    unset tmpdir
}

@test "bz runs bzip2 compression on file without bz2 extension" {
    local fname="$tmpdir/test.txt"
    echo "Test bz" > $fname
    local zipped_fname="${fname}.bz2"
    [ ! -f "${zipped_fname}" ]
    bz $fname
    [ ! -f "$fname" ]
    [ -f "${zipped_fname}" ]
}

@test "bz runs bzip2 decompression on file with bz2 extension" {
    local fname="$tmpdir/test.txt"
    echo "Test bz" > $fname
    [ -f "$fname" ]
    bzip2 -z "$fname"
    local zipped_fname="${fname}.bz2"
    [ -f  "$zipped_fname" ]
    bz "$zipped_fname"
    [ ! -f "$zipped_fname" ]
    [ -f "${fname}" ]
    [[ "Test bz" == "$(cat $fname)" ]]
}
