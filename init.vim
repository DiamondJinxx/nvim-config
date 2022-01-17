call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


syntax on
set background=dark
colorscheme gruvbox
set number
set expandtab
set tabstop=4
set noswapfile
