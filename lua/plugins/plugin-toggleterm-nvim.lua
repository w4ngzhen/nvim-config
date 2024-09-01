-- toggleterm 插件相关配置
--
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
      -- keymap
      require('keymap.keymap_terminal').setup();
    end
  }
}
