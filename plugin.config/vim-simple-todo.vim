let g:simple_todo_map_keys = 0

" Import function to have extion function for my workflow.
fu! s:get_list_marker(linenr) " {{{
  return substitute(getline(a:linenr), '^\s*\([-+*]\?\s*\).*', '\1', g:simple_todo_list_symbol)
endfu " }}}

nnore <silent> <Plug>(simple-todo-ext-new-start-of-line) mzI<c-r>=<SID>get_list_marker(line('.')-1)<cr>*<space>[ ]<space><Esc>`z4l

nmap  <leader>o <Plug>(simple-todo-below)
nmap  <leader>i <Plug>(simple-todo-ext-new-start-of-line)
nmap  <leader><Space> <Plug>(simple-todo-mark-switch)
vmap  <leader><Space> <Plug>(simple-todo-mark-switch)

