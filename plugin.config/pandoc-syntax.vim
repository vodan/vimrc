" disable concealing for lists, codeblocks and header
let g:pandoc#syntax#conceal#blacklist = [
    \ 'list',
    \ 'codeblock_start',
    \ 'codeblock_delim',
    \ 'atx',]

" enable syntax highligting for bash
let g:pandoc#syntax#codeblock#embeds#langs = ["bash=sh"]

" enable concealing of markdown links
let g:pandoc#syntax#conceal#urls = 1

" set filetype to pandoc and markdown
augroup pandoc_syntax
    autocmd!
    autocmd BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
augroup END
