" My VIMrc File
" author: vodan

"==============================================================================
" Configure Vundle
"==============================================================================
" The first time vundle need to be cloned manually then it manages itself.
" To clone it manually execute this:
" `$ git clone https://github.com/vundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" List of Vundle handled plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'colorsupport.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ervandew/supertab'
Plugin 'Shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'godlygeek/tabular'


call vundle#end()
filetype plugin indent on

" Function to load config file for each plugin easily
function! SourceConfigFile(name)
    let path = expand("~/.vim/plugin.config/" . a:name)
    if filereadable(l:path)
        execute "source ".fnameescape(l:path)
    else
        echom "config file ".a:name." is not readable."
    endif
endfunction

" Load config files for plugins
call SourceConfigFile("airline.vim")
call SourceConfigFile("fugitive.vim")
call SourceConfigFile("nerdtree.vim")
call SourceConfigFile("bufexplorer.vim")
call SourceConfigFile("neocomplete.vim")
call SourceConfigFile("ultisnips.vim")
call SourceConfigFile("pandoc-syntax.vim")
call SourceConfigFile("pandoc.vim")
call SourceConfigFile("pandoc-wiki.vim")
call SourceConfigFile("pretty-xml.vim")
call SourceConfigFile("tabular.vim")

"==============================================================================
" Color scheme for Vim
"==============================================================================
" Syntax-Higlighting
syntax on
" enable 256 colors
set t_Co=256

" reset to default color scheme
highlight normal term=none cterm=none ctermfg=none ctermbg=none gui=none

" set color scheme
silent! colorscheme jellybeans

" insert line for page break on 80 chars and 100 chars.
if exists('+colorcolumn')
    set colorcolumn=80,100
" as the plugin colorsupport does overwrite our highlight we need to execute
" it after the plugin with this autocmd.
augroup MyColors
    autocmd!
    autocmd VimEnter * highlight ColorColumn ctermbg=8 guibg=LightBlue
augroup END
endif

"==============================================================================
" Personal Options
"==============================================================================
" show row/column
set ruler
" show line numbers
set number
" set backupdir
set backupdir=~/.vim/backup
" wild mode for tab completion in command mode: like in the bash
set wildmode=longest,list

" tabwide 4 is best
set tabstop=4
set shiftwidth=4
" makes the spaces feel like real tabs
set softtabstop=4
" replace Tabs with spaces
set expandtab
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" always set autoindenting on
set autoindent

" display incomplete commands
set showcmd

" disable tab convert in Makefiles because Makefile don't work with spaces.
augroup local_file_settings
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END
"==============================================================================
" Personal key maps
"==============================================================================
" map leader key to space 
let mapleader = "\<Space>"

" Space + w to save a file
nnoremap <Leader>w :w<CR>

"Copy & Paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Automaticlally jump to the end of text you pasted
" Paste multiple lines multiple times
vnoremap <silen> y y`]
vnoremap <silen> p p`]
nnoremap <silen> p p`]

" use much faster key combination to leave insert mode
inoremap jk <ESC>`^
inoremap kj <ESC>`^
" use qq to leave visual mode
vnoremap qq <ESC>

" commands to fast access vimrc file and source it
command! SVIM execute "source ".$MYVIMRC
command! EVIM execute "vsplit ".$MYVIMRC

" clear search pattern
nnoremap <Leader>c :let  @/ = ""<CR>

" bind keys for spell checking
nnoremap <F5> :setlocal spell spelllang=en_us <Enter> :syntax spell toplevel <Enter> <C-l>
nnoremap <F6> :set nospell <Enter>

" change local working directory
command! CDC lcd %:p:h

