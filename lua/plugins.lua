print('plugins loaded')
local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed")
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

    use { 'neoclide/coc.nvim' , run = ':CocInstall coc-pyright' }
    -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }



end  
)
