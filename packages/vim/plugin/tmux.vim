" tmux will send xterm-style keys when its xterm-keys option is enabled
" NOTE: this relies on the arrow keys, which are disabled above (use b, w
"       instead)
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif
