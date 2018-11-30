" setup linters
let g:ale_linters = {
      \   'c': ['gcc', 'clang',],
      \   'markdown': ['alex'],
      \   'javascript': ['prettier', 'flow', 'eslint', 'stylelint'],
      \   'typescript': ['tslint', 'tsserver'],
      \ }
let g:ale_linter_aliases = {'jsx': 'css'}
let g:ale_fixers = {
      \   'javascript': ['prettier'],
      \   'typescript': ['prettier'],
      \ }
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_options =
      \ '--print-width 79 --single-quote --trailing-comma es5'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_sign_column_always = 3

nnoremap <Leader>al :ALEToggle<CR>
nnoremap <Leader>af :ALEFix<CR>
