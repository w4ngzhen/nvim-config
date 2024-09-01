local M = {};

--- 为formatter插件配置的格式化
--- 主要是针对formatter插件中配置的关于：JS、TS、CSS等前端代码
function M.setup_keymap_for_formatter()
    -- keymap设置
    local keymap = vim.keymap.set
    local opts = { noremap = true }
    keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
    keymap("n", "<leader>F", "<cmd>FormatWrite<CR>", opts)
end

return M
