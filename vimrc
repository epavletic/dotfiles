"""""""""""""""""""""""""""""""
"
" VIMRC
"
"""""""""""""""""""""""""""""""

syntax enable
filetype on
colorscheme wombat

set background=dark
set number

set tabstop=2
set softtabstop=2
set expandtab

set cursorline

if 'xterm-256color' == $TERM
  set t_Co=256
endif

au Filetype html  source ~/.vim/ftplugin/html.vim
au Filetype css   source ~/.vim/ftplugin/css.vim
