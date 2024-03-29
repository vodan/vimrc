" My VIMrc File
" author: vodan

" map leader key to space
" this need to be done here that all plugins use the same leader key
let mapleader = "\<Space>"
"==============================================================================
" Configure Vundle
"==============================================================================
" The first time vundle need to be cloned manually then it manages itself.
" To clone it manually execute this:
" `$ git clone https://github.com/vundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

set nocompatible
filetype off

scriptencoding utf-8
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

let REAL_USER = system("whoami| tr -d '\n'")

" List of Vundle handled plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
"Plugin 'gryf/wombat256grf'
"Plugin 'colorsupport.vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
if version >= 801
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'jlanzarotta/bufexplorer'
    Plugin 'fatih/vim-go'
    Plugin 'SirVer/ultisnips'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'vim-pandoc/vim-pandoc'
    if REAL_USER ==# "root"
        Plugin 'Shougo/neocomplete.vim'
    else
        Plugin 'ycm-core/YouCompleteMe'
        Plugin 'rdnetto/YCM-Generator'
    endif
endif
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'vitalk/vim-simple-todo'
Plugin 'mbbill/undotree'
Plugin 'majutsushi/tagbar'
Plugin 'somini/vim-autoclose'
Plugin 'rhysd/vim-grammarous'
Plugin 'embear/vim-foldsearch'
Plugin 'junegunn/vim-easy-align'
Plugin 'aklt/plantuml-syntax'
Plugin 'tyru/open-browser.vim'
Plugin 'weirongxu/plantuml-previewer.vim'
Plugin 'kalafut/vim-taskjuggler'

let g:plantuml_previewer#plantuml_jar_path = "/home/fpa/bin/plantuml.1.2018.7.jar"

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
if $USER ==# "root"
    call SourceConfigFile("neocomplete.vim")
else
    call SourceConfigFile("youcompleteme.vim")
endif
call SourceConfigFile("ultisnips.vim")
call SourceConfigFile("pandoc-syntax.vim")
call SourceConfigFile("pandoc.vim")
call SourceConfigFile("pandoc-wiki.vim")
call SourceConfigFile("pretty-xml.vim")
call SourceConfigFile("tabular.vim")
call SourceConfigFile("vim-simple-todo.vim")
call SourceConfigFile("undotree.vim")
call SourceConfigFile("tagbar.vim")

"==============================================================================
" Test
"==============================================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
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
"silent! colorscheme gryffin "kräftige farben, bisschen zu kräftig, Grün Blaues
"silent! colorscheme evening "angenehm für die augen dunkel
"silent! colorscheme ubaryd "Kräftige farben, aber angenehm, Rotes farbschema
"silent! colorscheme badwolf "Kräftige farben wie ubaryd, mehr rot
"silent! colorscheme triplejelly "pastell, angenehm, bisschen zu sehr pink
silent! colorscheme welpe "nice, blue, gefällt mir


" insert line for page break on 80 chars and 100 chars.
if exists('+colorcolumn')
    set colorcolumn=80,100

" make trailing whitespaces visible.
set listchars+=trail:·
" as the plugin colorsupport does overwrite our highlight we need to execute
" it after the plugin with this autocmd.
augroup MyColors
    autocmd!
    autocmd VimEnter * highlight ColorColumn ctermbg=8 guibg=LightBlue
    autocmd ColorScheme * highlight ColorColumn ctermbg=8 guibg=LightBlue
    autocmd ColorScheme * highlight Search ctermbg=8 guibg=LightBlue
" configure "set list" colors.
    autocmd VimEnter * highlight NonText ctermfg=1 guifg=Red
    autocmd VimEnter * highlight SpecialKey ctermfg=1 guifg=Red
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

" disable tab convert in Makefiles because Makefile don't work with spaces. Do
" the same for go files as go uses tabs instead of spaces.
augroup local_file_settings
    autocmd!
    autocmd FileType perl setlocal noexpandtab
    autocmd FileType perl setlocal softtabstop=0
    autocmd FileType make setlocal noexpandtab
    autocmd FileType make setlocal softtabstop=0
    autocmd FileType go setlocal noexpandtab
    autocmd FileType go setlocal softtabstop=0
    autocmd FileType go setlocal tabstop=2
    autocmd FileType go setlocal softtabstop=2
    autocmd FileType go setlocal shiftwidth=2
augroup END

let g:go_fmt_command = "~/go/bin/goimports"

" When editing a file, always jump to the last known cursor position.
" [[http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session]]
" * Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" * Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
" * disable in diff mode
autocmd BufReadPost *
 \ if &diff == 0 && line("'\"") > 1 && line("'\"") <= line("$") |
 \ exe "normal! g`\"" |
 \ endif

" disable line wrap for diffs
autocmd FilterWritePre * if &diff | setlocal wrap< | endif
"==============================================================================
" Personal key maps
"==============================================================================
" Space + w to save a file
nnoremap <Leader>W :w<CR>

"Copy & Paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Automaticlally jump to the end of text you pasted
" Paste multiple lines multiple times
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" use much faster key combination to leave insert mode
inoremap jk <ESC>`^
inoremap kj <ESC>`^
" use qq to leave visual mode
vnoremap qq <ESC>

" These work like # and g#, but do not move the cursor and always set hls.
nnoremap <silent> <Leader>#  :let @/ = '\<'.expand('<cword>').'\>'\|set hlsearch<CR>
nnoremap <silent> <Leader>g# :let @/ = expand('<cword>')\|set hlsearch<CR>

" commands to fast access vimrc file and source it
command! SVIM execute "source ".$MYVIMRC
command! EVIM execute "vsplit ".$MYVIMRC

" command to write as root
command! WROOT execute "w !sudo cat >%"

" clear search pattern
nnoremap <Leader>c :let  @/ = ""<CR>

" Ctags help
nnoremap <Leader>9 <C-]>
nnoremap <Leader>8 <C-t>

" Grep for word under the cursor starting from the directory of the file in
" the active window or grep for it in the current vim directory.
" FIXME: add subfunction and pass path
nnoremap <Leader>gr :echom "grep for '<cword>' in '%:p:h/*'"<Bar> :cexpr system('grep -Iinr '.expand('<cword>').' '.expand('%:p:h').'/*')<CR>
nnoremap <Leader>gR :echom "grep for '<cword>' in '*'"      <Bar> :cexpr system('grep -Iinr '.expand('<cword>').' *')<CR>

" bind keys for spell checking
nnoremap <F5> :setlocal spell spelllang=en_us <Enter> :syntax spell toplevel <Enter> <C-l>
nnoremap <F6> :set nospell <Enter>
" command to enable german spell checking.
command! SPELL execute "normal! :setlocal spell spelllang=de_de <Enter> :syntax spell toplevel <Enter> <C-l>"

" remap n and N for diff view.
if &diff
nnoremap <leader>n n
nnoremap <leader>N N
nnoremap n ]czz
nnoremap N [czz
endif

" retrieve the current toplevel git directory (remove trailing newline)
let $VIM_GIT_DIR = substitute(system("git rev-parse --absolute-git-dir"), '\n$', '','')
let $VIM_CTAG_FILE = $VIM_GIT_DIR."/tags"
set tags^=$VIM_CTAG_FILE

if has("cscope")
    " check cscope for definition of a symbol before checking ctags
    set csto=0
    set cscopetag 
    set cscopeverbose
    let $VIM_CSCOPE_DATABASE = $VIM_GIT_DIR.'/cscope.out'
    if filereadable($VIM_CSCOPE_DATABASE)
        cs add $VIM_CSCOPE_DATABASE $VIM_GIT_DIR/../
    endif
endif

" change local working directory
command! CDC lcd %:p:h

augroup local_help_settings
    autocmd!
    autocmd FileType help nnoremap t <C-]>
augroup END

