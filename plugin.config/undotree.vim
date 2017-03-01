" map undo window
nnoremap <leader>u :UndotreeToggle<cr>

" change window layout
let g:undotree_WindowLayout = 4
" do not highlight changes text
let g:undotree_HighlightChangedText = 0

" store undo files together
set undodir=~/.undodir/
set undofile
