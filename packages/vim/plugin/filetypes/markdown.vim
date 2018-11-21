" highlight bad phrases for FOSS markdown files
fun! HighlightOssWarnings()
  match OssWarnings /\c\<\%(obviously\|basically\|simply\|of\scourse\|clearly\|\<just\>\|everyone\sknows\|however\|so,\|easy\)\>/
endfun

augroup focussed_writing
  " hide tmux and vim bars and configure limelight
  function! s:goyo_enter()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    set noshowmode
    set noshowcmd
    set scrolloff=999
    Limelight 0.75
  endfunction

  " reset tmux and vim bars and disable limelight
  function! s:goyo_leave()
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    set showmode
    set showcmd
    set scrolloff=5
    Limelight!
  endfunction

  autocmd FileType markdown set textwidth=79
  autocmd InsertEnter *.md call HighlightOssWarnings()
  autocmd InsertLeave *.md call HighlightOssWarnings()

  """" Goyo + Limelight
  autocmd! User GoyoEnter call s:goyo_enter()
  autocmd! User GoyoLeave call s:goyo_leave()
  nnoremap <Leader>G :Goyo<CR>
augroup END

hi def link OssWarnings Error
