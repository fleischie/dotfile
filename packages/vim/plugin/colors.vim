" add a list of acceptable colorschemes
let s:list_of_good_colorschemes = [
      \ 'badwolf',
      \ 'brogrammer',
      \ 'deepsea',
      \ 'distinguished',
      \ 'molokai',
      \ ]

" use 24-bit colors (necessary for various color schemes)
set termguicolors

" enable random colors on boot
" default to molokai if the rando-plugin couldn't be loaded
augroup rando_color
  function! SetRandomColor()
    if exists("g:loaded_rando")
      execute "colorscheme" Choice(s:list_of_good_colorschemes)
    else
      colorscheme molokai
    endif

    if exists("g:loaded_airline")
      AirlineRefresh
    endif
  endfunction

  autocmd! VimEnter * :call SetRandomColor()
augroup END
