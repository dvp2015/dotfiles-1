#!/usr/bin/env bash

# Build boost library (all variants)

boost_version=1.66
opts="--build-dir=/tmp/build-boost"
opts="$opts toolset=gcc"
opts="$opts --build-type=complete"
opts="$opts --layout=versioned"
opts="$opts --stagedir=$HOME/lib/boost/${boost_version}/lib stage"

b2 $opts
