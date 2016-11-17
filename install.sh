#! /bin/bash

if [ ! -d "$HOME/.vim/bundle" ]; then
    mkdir -p $HOME/.vim/bundle
fi
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    # Clone Vundle the first time
    git clone https://github.com/vundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
if [ ! -d "$HOME/.vim/backup" ]; then
    mkdir -p $HOME/.vim/backup
fi

# unlink existing links to update them.
if [ -L "$HOME/.vimrc" ]; then
    unlink $HOME/.vimrc 
fi
if [ -L "$HOME/.vim/plugin.config" ]; then
    unlink $HOME/.vim/plugin.config 
fi
if [ -L "$HOME/.vim/privatSnips" ]; then
    unlink $HOME/.vim/privatSnips 
fi

SCRIPT=$(dirname $(readlink -e $0))
ln -s $SCRIPT/vimrc $HOME/.vimrc
ln -s $SCRIPT/plugin.config $HOME/.vim/plugin.config
ln -s $SCRIPT/privatSnips $HOME/.vim/privatSnips

vim +PluginInstall +qall
