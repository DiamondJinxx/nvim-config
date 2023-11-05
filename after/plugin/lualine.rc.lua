local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local function symbol_line()
  local curwin = vim.g.statusline_winid or 0
  local curbuf = vim.api.nvim_win_get_buf(curwin)
  local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
  return ok and line or ''
end

lualine.setup{
    options = {
        icons_enabled = true,
        theme = 'solarized_dark',
        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        disabled_filetypes = {}

     },
     sections = {
         lualine_a = { 'mode' },
         lualine_b = { 'branch' },
         lualine_c = { { 
             'filename',
             file_status = true,
             path = 0 -- 0 = only filename
         } },
         lualine_x = {
             { 'diagnostincs', sources = { 'nvim_diagnostic', 'coc' }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
         },
         lualine_y = { 
            symbol_line 
            -- 'progress'
         },
         lualine_z = { 'location' },
     },
     inactive_sections = {
         lualine_a = {},
         lualine_b = {},
         lualine_c = { { 
             'filename',
             file_status = true,
             path = 1 -- 1 = relative path
         } },
         lualine_x = { 'location' },
         lualine_y = {},
         lualine_z = {},
     },
     tabline = {},
     extension = { 'fugitive' }
}
