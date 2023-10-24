local status, telescope = pcall(require, 'telescope')

if (not status) then
    print('telescope not installed')
end

local telescope_actions = require('telescope.actions')
telescope.setup{
    defaults = {
            mappings = {
                    i = {
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
local keymap = vim.keymap

keymap.set('n', '<leader>ff', ':Telescope find_files<Return>')
keymap.set('n', '<leader>fg', ':Telescope live_grep<Return>')
keymap.set('n', '<leader>sb', ':Telescope current_buffer_fuzzy_find<Return>')
keymap.set('n', '<leader>fb', ':Telescope buffers<Return>')
keymap.set('n', '<leader>gf', ':Telescope git_files<Return>')
keymap.set('n', '<leader>gt', ':Telescope git_status<Return>')
keymap.set('n', '<leader>gc', ':Telescope git_commits<Return>')
keymap.set('n', '<leader>gb', ':Telescope git_branches<Return>')
keymap.set('n', '<leader>gr', ':Telescope lsp_references<Return>')
keymap.set('n', '<leader>ts', ':Telescope treesitter<Return>')

