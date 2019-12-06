" setup linters
let g:ale_linters = {
      \   'c': ['gcc', 'clang',],
      \   'markdown': ['alex'],
      \   'javascript': ['prettier', 'flow', 'eslint', 'stylelint'],
      \   'typescript': ['tslint', 'tsserver'],
      \ }
let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_fixers = {
      \   'c': ['clang-format'],
      \   'cpp': ['clang-format'],
      \   'html': ['tidy', 'prettier'],
      \   'javascript': ['prettier'],
      \   'rust': ['rustfmt'],
      \   'typescript': ['prettier'],
      \ }
let g:ale_c_clangformat_options = '-style mozilla'
let g:ale_fix_on_save = 0

let g:ale_sign_column_always = 3

nnoremap <Leader>al :ALEToggle<CR>
nnoremap <Leader>af :ALEFix<CR>
