" prettyfie your xml
command! -range=% -nargs=* Tidy <line1>,<line2>!tidy -config ~/.vim/plugin.config/xml_indent.config
command! -range=% -nargs=* XSD <line1>,<line2>!xsltproc ~/.vim/plugin.config/fix-indent.xsd - 2> /dev/null
function! DoTidy()
    let l = line(".")
    let c = col(".")
    :XSD
    :Tidy
    call cursor(l,c)
endfun

augroup prettyxml
    autocmd!
    autocmd Filetype xml nmap <F8> :call DoTidy() <Enter> <Enter>
    autocmd Filetype xml vmap <F8> :Tidy <Enter>
    autocmd Filetype xml setlocal shiftwidth=2 tabstop=2 softtabstop=2 indentexpr=""
    autocmd Filetype html setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END
