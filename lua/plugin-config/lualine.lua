require('lualine').setup{
    options = {
        -- 不使用icon
        icons_enabled = false,
        theme = 'auto',
        component_separators = { left = '[', right = ']'},
        section_separators = { left = '(', right = ')'},
        disabled_filetypes = {},
        always_divide_middle = true,
    }
}