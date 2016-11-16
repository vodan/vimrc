let wiki_path='~/doc/wiki/'
let wiki_diary=wiki_path.'diary/'
let last_buffer = ""
let buffer_before_wiki = ""

nnoremap <leader>ww :call GotoWiki()<cr>
augroup pandoc
    autocmd!
    autocmd FileType pandoc call SetKeyMaps()
    autocmd FileType pandoc :set foldmethod=marker
augroup END

function! SetKeyMaps()
    nnoremap <leader>wb :call GoBacktoWork()<cr>
    " use keymap of pandoc to follow a link
    nnoremap <Enter> :call pandoc#hypertext#OpenLink( g:pandoc#hypertext#edit_open_cmd )<cr>
    " use keymap of pandoc to go back to previeus file
    nnoremap <BS> :call pandoc#hypertext#BackFromLink()<cr>
    " use keymap of pandoc to jump to the next link.
    nnoremap <tab> :call FindNextLink()<cr>
endfunction

function! GotoWiki()
    echom "Open Wikipage"
    let g:last_buffer = expand('%:p')
    let g:buffer_before_wiki = expand('%:p')
    execute "edit ".g:wiki_path."index.md"
    execute "lcd ".expand("%:p:h")
endfunction
function! GoBack()
    if g:last_buffer ==? ""
    else
        echom "Go back to old Buffer:".g:last_buffer
        execute "edit ".g:last_buffer
        execute "lcd ".expand("%:p:h")
    endif
endfunction
function! GoBacktoWork()
    if g:buffer_before_wiki ==? ""
    else
        echom "Go back to old Buffer:".g:buffer_before_wiki
        execute "edit ".g:buffer_before_wiki
        execute "lcd ".expand("%:p:h")
    endif
endfunction

function! FindNextLink()
    let origin_pos = getpos(".")
    let search_from = getpos(".")
    call cursor(search_from[1], 2)
    " search for a regular link
    let l_lnum = search('\v!?\[[^]]+\]\(([^) \t]+).*\)')
    " if we are already on a line with a link jump to next line
    if origin_pos[1] == l_lnum
        call cursor(search_from[1]+1, 2)
        let l_lnum = search('\v!?\[[^]]+\]\(([^) \t]+).*\)')
    endif
    " use pandoc to jump to the next link line
    call pandoc#keyboard#MovetoLine(l_lnum)
    " jump to the start of the link in the line
    execute "normal! f[\<esc>"
endfunction

