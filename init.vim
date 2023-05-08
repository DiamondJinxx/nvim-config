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
Plug 'nvim-lua/plenary.nvim' "library with lua functions for vim
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'scrooloose/nerdcommenter' "Smart comment
Plug 'honza/vim-snippets' " Install coc-snippets. Do I realy need vim-snippets? only for customization snippets

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'leafOfTree/vim-project'

Plug 'cdelledonne/vim-cmake'

Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'chrisbra/csv.vim'
call plug#end()

syntax on
set background=dark "light
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
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm():
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
inoremap <expr><C-k> coc#pum#visible() ? coc#pum#prev(1): "\<C-h>"
inoremap <expr><C-j> coc#pum#visible() ? coc#pum#next(1): "\<C-h>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<m-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<m-k>'

function! CheckBackspace() abort
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
}

require("todo-comments").setup {
--  keywords = {
--    WARN = { icon = " ", color = "warning", alt = { "WARN", "XXX" } },
--  },
}

EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>sb <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gt <cmd>Telescope git_status<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
nnoremap <leader>ts <cmd>Telescope treesitter<cr>



" Settings for comments
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

nnoremap <leader>pl <cmd>ProjectList<cr>


let g:ag = {}
let g:ag.working_path_mpde = 'r'


" options: 'ask'(default), 'always', 'no'
let g:vim_project_config = {
            \'config_home': '~/.vim/vim-project-config',
            \'auto_detect': 'ask',
            \'auto_detect_file': ['.git'],
            \   }
"let g:vim_project_config = {
      "\'config_home':                   '~/.vim/vim-project-config',
      "\'project_base':                  ['~'],
      "\'use_session':                   0,
      "\'open_root_when_use_session':    0,
      "\'check_branch_when_use_session': 0,
      "\'project_root':                  './',
      "\'auto_load_on_start':            0,
      "\'include':                       ['./'],
      "\'exclude':                       ['.git', 'node_modules', '.DS_Store'],
      "\'search_include':                [],
      "\'find_in_files_include':         [],
      "\'search_exclude':                [],
      "\'find_in_files_exclude':         [],
      "\'auto_detect':                   'ask',
      "\'auto_detect_file':              ['.git', '.svn'],
      "\'project_views':                 [],
      "\'file_mappings':                 {},
      "\'debug':                         0,
      "\}
"run code
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

autocmd FileType htmldjango imap <buffer> set tabstop=2

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType javascript AutoFormatBuffer prettier
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

call project#begin()
