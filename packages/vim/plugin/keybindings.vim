" disable arrow keys
noremap <UP> <nop>
noremap <DOWN> <nop>
noremap <LEFT> <nop>
noremap <RIGHT> <nop>

" remap for tags, tabgar -> vim-IDE ftw :)
nnoremap <silent> <F9> :TagbarToggle<CR>
nnoremap <silent> <F10> :set list!<CR>

" close all quickfix/location lists
noremap <Leader>c :lcl\|ccl\|pclose<CR>

" search in file tree
noremap <Leader>r :Rg<Cr>

" sort
noremap <Leader>s :sort i<CR>

" insert current date time
noremap <Leader>lm :put =strftime('Last modified: %d. %B %Y %H:%M')<CR>

" remaps for incrementing/decrementing numbers
" the second pair is for mac keyboards
map <A-a> <C-a>
map <A-x> <C-x>
map å     <C-a>
map ≈     <C-x>

" remaps for moving lines (with vim-move)
map ∆ <A-j>
map ˚ <A-k>
