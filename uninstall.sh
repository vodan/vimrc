#! /bin/bash

read -p "Your are about to delete .vim folder in home. Are you sure you want that? y/n: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    unlink $HOME/.vimrc
    rm -rf $HOME/.vim
fi
