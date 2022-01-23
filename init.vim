call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MattesGroeger/vim-bookmarks'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'albfan/ag.vim'
" Bazel plugin settings
" Add maktaba and bazel to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'
"plugins for file search
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' } " can commons for ask,ag,ripgrep and other serchers
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'scrooloose/nerdcommenter' "Smart comment
Plug 'honza/vim-snippets'
call plug#end()

syntax on
set background=dark
colorscheme gruvbox
set number
set expandtab
set tabstop=4
set noswapfile
set scrolloff=7
set fileformat=unix
set autoindent
set autochdir

nnoremap ,<space> :nohlsearch<CR>
nnoremap <C-w> :bd <CR>
" NerdTree
nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Coc settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nn <silent> K :call CocActionAsync('doHover')<cr>
nmap <silent> gh :call CocLocations('ccls', '$ccls/inheritance')<CR>


" local function
let g:project_dir = "/home/qxz20fg/BMW/"
let g:config_file = "/home/qxz20fg/.config/init.vim"
"
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" : 
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<C-h>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion -- I like it
if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
else
        inoremap <silent><expr> <c-@> coc#refresh()
endif


"Definet Settings
"Project navigation
let g:project_dir = '/home/qxz20fg/BMW/ddad'
function! FindInProject()
        let l:file = input("File: ")
        execute(':Ack '.l:file.g:project_dir)
endfunction
nnoremap <leader>fp :call FindInProject()<CR>
let mapleader = ';'

lua << EOF
require('telescope').setup{
defaults = {
        mappings = {
                i = {
                        ["<C-j>"] = require('telescope.actions').move_selection_next,
                        ["<C-k>"] = require('telescope.actions').move_selection_previous,
                        ["<C-n>"] = require('telescope.actions').move_selection_better,
                        ["<C-p>"] = require('telescope.actions').move_selection_worse,

                        } 
                }
        },
pickers = {
        find_files = {
                      cwd = '/home/qxz20fg/BMW/ddad',
                },
        live_grep = {
                      cwd = '/home/qxz20fg/BMW/ddad',
                }
        },
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gt <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
" Settings for comments
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"Vim Snippets1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


let g:ctrlp_root_markers = ['ddad']
let g:ctrlp_working_path_mode = 'ra'

let g:ag = {}
let g:ag.working_path_mpde = 'r'
