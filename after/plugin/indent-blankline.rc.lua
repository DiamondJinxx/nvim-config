local status, blankline = pcall(require, 'ibl')

if (not status) then
    print('indent-blankline doesn\'t install')
    return
end



-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
blankline.setup {
    indent = { char = '┊', }
--  char = '┊',
--  show_trailing_blankline_indent = false,
}
