" prettyfie your xml
command! -range=% -nargs=* Tidy <line1>,<line2>!tidy -config ~/.vim/plugin.config/xml_indent.config
command! -range=% -nargs=* XSD <line1>,<line2>!xsltproc ~/.vim/plugin.config/fix-indent.xsd - 2> /dev/null

function! DoTidy()
    let l = line(".")
    let c = col(".")
    ":XSD
    :Tidy
    call cursor(l,c)
endfun

" Use this function as filetype autocmd of xml will overwrite our options. In
" special formatexpr and formatoptions.
function! OverwriteXMLft()
    let my_filetype = &filetype
    if my_filetype ==? "xml"
        setlocal shiftwidth=2
        setlocal tabstop=2
        setlocal softtabstop=2
        setlocal indentexpr=""
        setlocal formatexpr=""
        setlocal formatoptions+=t
        setlocal formatoptions-=l
    endif
endfun

augroup prettyxml
    autocmd!
    autocmd Filetype xml nmap <F8> :call DoTidy() <Enter> <Enter>
    autocmd Filetype xml vmap <F8> :Tidy <Enter>
    autocmd Filetype xslt setlocal shiftwidth=2 tabstop=2 softtabstop=2 indentexpr=""
    autocmd BufEnter,BufRead,BufReadPost * call OverwriteXMLft()
    autocmd Filetype html setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
