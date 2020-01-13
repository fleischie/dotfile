" setup to insert 2-space wide spaces
augroup custom_indent
  autocmd FileType * set expandtab shiftwidth=2 softtabstop=2 tabstop=2
augroup END

" tell clang to use the library directly
let g:clang_use_library = 1

" set clang completion behavior
let g:clang_close_preview = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1

" set clang library path for different OS
let s:os = substitute(system('uname'), '\n', '', '')
if s:os == 'Darwin' || s:os == 'Mac'
  let g:clang_library_path = '/usr/local/opt/llvm/lib/libclang.dylib'
else
  let g:clang_library_path = '/usr/lib/libclang.so'
endif
