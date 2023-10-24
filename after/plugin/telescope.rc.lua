local status, telescope = pcall(require, 'telescope')

if (not status) then
    print('telescope not installed')
end

local actions = require('telescope.actions')

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup{
    defaults = {
        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_better,
                ["<C-p>"] = actions.move_selection_worse,
                ["<C-d>"] = actions.delete_buffer,
            },
            n = {
                ["<C-d>"] = actions.delete_buffer,
            },
        },
    },
    extensions = {
       file_browser = {
         theme = "dropdown", -- disables netrw and use telescope-file-browser in its place
         hijack_netrw = true,
         mappings = {
           -- your custom insert mode mappings
           ["i"] = {
             ["<C-w>"] = function() vim.cmd('normal vbd') end,
           },
           ["n"] = {
             -- your custom normal mode mappings ["N"] = fb_actions.create,
             ["h"] = fb_actions.goto_parent_dir,
             ["/"] = function()
               vim.cmd('startinsert')
             end,
             ["<C-u>"] = function(prompt_bufnr)
               for i = 1, 10 do actions.move_selection_previous(prompt_bufnr) end
             end,
             ["<C-d>"] = function(prompt_bufnr)
               for i = 1, 10 do actions.move_selection_next(prompt_bufnr) end
             end,
             ["<PageUp>"] = actions.preview_scrolling_up,
             ["<PageDown>"] = actions.preview_scrolling_down,
           },
         },
       },
    }, 
    
}
local keymap = vim.keymap

keymap.set('n', '<leader>ff', ':Telescope find_files<Return>')
keymap.set('n', '<leader>rr', ':Telescope resume<Return>')
keymap.set('n', '<leader>ht', ':Telescope help_tags<Return>')
keymap.set('n', '<leader>fd', ':Telescope diagnostics<Return>')
keymap.set('n', '<leader>fg', ':Telescope live_grep<Return>')
keymap.set('n', '<leader>sb', ':Telescope current_buffer_fuzzy_find<Return>')
keymap.set('n', '<leader>fb', ':Telescope buffers<Return>')
keymap.set('n', '<leader>gf', ':Telescope git_files<Return>')
keymap.set('n', '<leader>gt', ':Telescope git_status<Return>')
keymap.set('n', '<leader>gc', ':Telescope git_commits<Return>')
keymap.set('n', '<leader>gb', ':Telescope git_branches<Return>')
keymap.set('n', '<leader>gr', ':Telescope lsp_references<Return>')
keymap.set('n', '<leader>ts', ':Telescope treesitter<Return>')

telescope.load_extension("file_browser")


vim.keymap.set("n", "<leader>ft", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    --cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
