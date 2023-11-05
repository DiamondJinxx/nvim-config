local status, packer = pcall(require, 'packer')
if (not status) then print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'hoob3rt/lualine.nvim' -- Status line
    use { 
         'neoclide/coc.nvim',
         branch = 'release',
         requires = { 'airblade/vim-rooter' },
         run = ':CocInstall coc-pyright',
     }
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'rcarriga/nvim-notify'
    use 'MunifTanjim/nui.nvim'
    use 'folke/noice.nvim' -- notification windows
    use 'folke/todo-comments.nvim' -- highlight todo comments
    use 'folke/trouble.nvim'
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'preservim/tagbar' -- simple file structure, need ctags
    use 'lewis6991/gitsigns.nvim' -- inline and chunks git blame
    use 'tpope/vim-fugitive' -- git comands from vim
    use 'lukas-reineke/indent-blankline.nvim' -- set sign for blankline
    use 'nvim-telescope/telescope.nvim'
    use 'scrooloose/nerdcommenter' -- Smart comment
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
 
    use { 'nvim-treesitter/nvim-treesitter' }
    use { 
        'numToStr/Comment.nvim',
        requires = {
          'JoosepAlviste/nvim-ts-context-commentstring'
        }
    }
    -- use 'simrat39/symbols-outline.nvim' -- not currently work with Coc



end  
)
