#! /bin/bash

if [[ $REPLY =~ ^[Yy]$ ]]; then
    unlink $HOME/.vimrc
    unlink $HOME/.vim/plugin.config
fi
