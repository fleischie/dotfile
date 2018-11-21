" enable delayed completion on startup
set completeopt=menuone,preview,noinsert
let g:mucomplete#enable_auto_at_startup = 1
" extend default chain to include UltiSnips snippets
let g:mucomplete#chains = {
      \ 'vim': ['path', 'cmd', 'keyn'],
      \ 'default': ['path', 'omni', 'defs', 'keyp', 'ulti']
      \ }

" expand snippets on <Ctrl-L>
let g:UltiSnipsExpandTrigger = '<f5>'
let g:UltiSnipsJumpForwardTrigger = '<f6>'

"" completion-related keybindings
inoremap <silent> <expr> <plug>ExpandCR
      \ mucomplete#ultisnips#expand_snippet("\<cr>")
imap <c-l> <plug>ExpandCR
imap <c-j> <plug>(MUcompleteFwd)
