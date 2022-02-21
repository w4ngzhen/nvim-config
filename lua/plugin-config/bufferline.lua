vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        indicator_icon = '>>',
        -- buffer关闭
        buffer_close_icon = '[x]',
        -- 文件修改状态icon
        modified_icon = '●',
        -- 不显示右上角全局关闭icon
        show_close_icon = false,
    }
}
