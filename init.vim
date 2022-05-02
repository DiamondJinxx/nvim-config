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
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
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
Plug 'honza/vim-snippets' " Install coc-snippets. Do I realy need vim-snippets? only for customization snippets

Plug 'terryma/vim-multiple-cursors'
Plug 'leafOfTree/vim-project'

Plug 'cdelledonne/vim-cmake'

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'

Plug 'chrisbra/csv.vim'
call plug#end()

syntax on
set background=dark
colorscheme gruvbox
set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set noswapfile
set scrolloff=7
set fileformat=unix
set autoindent
set autochdir
set cursorline
set mouse=a

let mapleader = ';'
nnoremap ,<space> :nohlsearch<CR>
" NerdTree
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Coc settings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gm <Plug>(coc-type-implementation)
"nmap <silent> gy <Plug>(coc-type-definition)
nn <silent> gk :call CocActionAsync('doHover')<cr>
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

lua << EOF
local telescope_actions = require('telescope.actions')
require('telescope').setup{
defaults = {
        mappings = {
                i = {
                        ["<C-j>"] = telescope_actions.move_selection_next,
                        ["<C-k>"] = telescope_actions.move_selection_previous,
                        ["<C-n>"] = telescope_actions.move_selection_better,
                        ["<C-p>"] = telescope_actions.move_selection_worse,
                        ["<C-d>"] = telescope_actions.delete_buffer,

                        } 
                },
            n = {

                        ["<C-d>"] = telescope_actions.delete_buffer,
                },
            i = {

                        ["<C-d>"] = telescope_actions.delete_buffer,
                },
        },
pickers = {
        find_files = {
                      cwd = '/home/life',
                },
        live_grep = {
                      cwd = '/home/life',
                }
        },
}

require("todo-comments").setup {
  keywords = {
    WARN = { icon = " ", color = "warning", alt = { "WARN", "XXX" } },
  },
}
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gt <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
" Settings for comments
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


"Vim Snippets1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"let g:UltiSnipsExpandTrigger="<tab>"

let g:ctrlp_root_markers = ['ddad']
let g:ctrlp_working_path_mode = 'ra'

let g:ag = {}
let g:ag.working_path_mpde = 'r'


let g:vim_project_config = '~/projects/.vim'
" options: 'ask'(default), 'always', 'no'
let g:vim_project_auto_detect = 'ask'

"run code
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType htmldjango imap <buffer> set tabstop=2

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

call project#begin()
