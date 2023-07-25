return {
  "mhartington/formatter.nvim",
  config = function()
    local ft_names = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    }
    local filetype = {}
    for _, ft_name in ipairs(ft_names) do
      filetype[ft_name] = {
        -- 上述的filetype，都直接使用对应目录下的preitter
        require("formatter.filetypes." .. ft_name).prettier
      }
    end
    require('formatter').setup({
      filetype = filetype
    })
    -- keymap设置
    local keymap = vim.keymap.set
    local opts = { noremap = true }
    keymap("n", "<leader>f", "<cmd>Format<CR>", opts)
    keymap("n", "<leader>F", "<cmd>FormatWrite<CR>", opts)
  end
}
