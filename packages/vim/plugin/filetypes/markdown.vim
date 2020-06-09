" highlight bad phrases for FOSS markdown files
fun! HighlightOssWarnings()
  match OssWarnings /\c\<\%(obviously\|basically\|simply\|of\scourse\|clearly\|\<just\>\|everyone\sknows\|however\|so,\|easy\)\>/
endfun

augroup focussed_writing
  autocmd FileType markdown set textwidth=79
  autocmd InsertEnter *.md call HighlightOssWarnings()
  autocmd InsertLeave *.md call HighlightOssWarnings()
augroup END

hi def link OssWarnings Error
