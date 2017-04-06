" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" extend the search directories for multiple snippet categories.
let g:UltiSnipsSnippetDirectories = ["privatSnips", "workSnips"]
"let g:UltiSnipsSnippetDirectories = ["UltiSnips", "privatSnips", "workSnips"]

" while we editing snippets we disable the preview window this is a workaround
" as the preview window of YCM does let Ultisnippet loose its focus and jump
" to next snippet does not work.
autocmd! User UltiSnipsEnterFirstSnippet
autocmd User UltiSnipsEnterFirstSnippet set completeopt-=preview
autocmd! User UltiSnipsExitLastSnippet
autocmd User UltiSnipsExitLastSnippet set completeopt+=preview
