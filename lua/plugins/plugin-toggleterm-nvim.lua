-- toggleterm 插件相关配置
-- 
-- 插件keymap设置
local function set_keymap()
  -- 通过自定义terminal，调用外部安装的lazygit
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit  = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    -- 添加on_close才能在lazygit异常的时候终端不闪退
    on_close = function()
      vim.cmd("echo on_close")
    end,
  })

  function _lazygit_toggle()
    lazygit:toggle()
  end

  vim.api.nvim_set_keymap(
    "n",
    "<C-M-\\>",     --CTRL+ALT+\
    "<cmd>lua _lazygit_toggle()<CR>",
    { noremap = true, silent = true }
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
        direction = 'float',
        open_mapping = [[<C-\>]],
      })
      --
      set_keymap()
    end
  }
}
