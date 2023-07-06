-- toggleterm 插件相关配置
--
-- 插件keymap设置
local function set_keymap()
  local opts = { noremap = true, silent = true }
  -- 经典keymap
  vim.api.nvim_set_keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
  -- 当处于TERMINAL 模式下，<leader>n 可映射为退出TERMINAL模式进入到NORMAL模式的keymap
  vim.api.nvim_set_keymap("t", "<leader>n", "<C-\\><C-N>", opts)

  -- 通过自定义terminal，调用外部安装的lazygit
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit  = Terminal:new({
    cmd = "lazygit",
    hidden = false,
    direction = 'float',
    on_open = function(term)
    end
  })

  function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap(
    "n",
    "<leader>git",
    "<cmd>lua _lazygit_toggle()<CR>",
    opts
  )
end
return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      -- config toggleterm.
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        direction = 'horizontal',
        open_mapping = [[<leader>tt]],
      })
      --
      set_keymap()
    end
  }
}
