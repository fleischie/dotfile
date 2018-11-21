" display previous search items
set hlsearch

" extend path to search for when using `gf` for example
set path+=**

" setup vim-ripgrep
let g:rg_binary = 'rg'
let g:rg_command = g:rg_binary . " --vimgrep -S"
