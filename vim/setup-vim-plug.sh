#!/usr/bin/env bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if command -v vim >/dev/null 2>&1; then
    echo "Bootstraping Vim"
    vim '+PlugUpdate' '+PlugClean!' '+PlugUpdate' '+qall'
fi
