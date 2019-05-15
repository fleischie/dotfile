" enable delayed completion on startup
set completeopt=menuone,preview,noinsert
let g:mucomplete#enable_auto_at_startup = 1
" extend default chain to include UltiSnips snippets
let g:mucomplete#chains = {
      \ 'vim': ['path', 'cmd', 'keyn'],
      \ 'default': ['path', 'omni', 'defs', 'keyp', 'ulti']
      \ }

" setup UltiSnips
let g:UltiSnipsEnableSnipMate = 1
let g:UltiSnipsSnippetDirectories = []
let g:UltiSnipsExpandTrigger = '<f5>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'

"" completion-related keybindings
inoremap <silent> <expr> <plug>ExpandCR
      \ mucomplete#ultisnips#expand_snippet("\<cr>")
imap <c-l> <plug>ExpandCR
imap <c-j> <plug>(MUcompleteFwd)
imap <c-b> <plug>(MUcompleteCycFwd)
