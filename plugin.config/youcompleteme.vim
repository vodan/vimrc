"==============================================================================
"YouCompleteMe
"==============================================================================
" Tell YCM where our global config is
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" Ask before other config will be loaded for security reasons.
let g:ycm_confirm_extra_conf = 0
" Add Preview window to functions
let g:ycm_add_preview_to_completeopt = 1
" Close Preview window after insert mode has been leaved.
let g:ycm_autoclose_preview_window_after_insertion = 1
" Open Goto Command in same buffer
let g:ycm_goto_buffer_command = 'same-buffer'
" Disable YCM
let g:ycm_filetyp_blacklist = {
    \ 'notes' : 1,
    \ 'Makefiles' : 1,
    \}
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_key_invoke_completion = '<C-c>'
