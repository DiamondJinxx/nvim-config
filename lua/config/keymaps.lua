-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- New tab
keymap.set("n", "te", ":tabedit<Return>", { silent = true })
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Spliting windows
keymap.set("n", "ss", ":split<Return>", { silent = true })
keymap.set("n", "sv", ":vsplit<Return>", { silent = true })

-- Diagnostics
keymap.set("n", "<C-]>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<C-]>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Move window
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w>>")
keymap.set("n", "<C-w><right>", "<C-w><")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", ",<space>", ":nohlsearch<Return>")
keymap.set("n", "<leader>so", ":CocOutline<Return>")

-- Terminal
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>")
vim.keymap.set("n", "<leader>tv", ":ToggleTerm direction=vertical size=40<CR>")
