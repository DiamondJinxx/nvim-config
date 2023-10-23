-- do I need autocmd for different mappings for different langs?
--vim.cmd('autocmd!)

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.writebackup = false -- coc req
vim.opt.updatetime = 300 -- coc req
vim.opt.signcolumn = "yes" -- coc req
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.ai = true -- Autoindent
vim.opt.si = true -- Smart indent
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append {'**'} -- finding files - search down into subfolders


-- Undercurl, not work in iTerm2
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- what is it??
vim.api.nvim_create_autocmd("InsertLeave", {
   pattern = '*',
   command = "set nopaste"
})
