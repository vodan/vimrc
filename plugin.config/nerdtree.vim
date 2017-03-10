"==============================================================================
"nerdtree
"==============================================================================

" Toggle nerdtree window
noremap <C-n> :NERDTreeToggle<CR>

" open file browser in currents file directory
command! E execute "NERDTree ".expand('%:h')

" increase size of the nerdtree to full window.
let NERDTreeWinSize=70
