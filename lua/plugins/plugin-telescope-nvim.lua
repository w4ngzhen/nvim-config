-- 插件相关快捷键配置
local function set_keymap()
  local builtin = require('telescope.builtin')
  local opt = { noremap = true }
  vim.keymap.set('n', '<leader><F1>', builtin.find_files, opt)
  vim.keymap.set('n', '<leader><F2>', builtin.grep_string, opt)
  vim.keymap.set('n', '<leader><F3>', builtin.live_grep, opt) -- 依赖ripgrep
  -- 打开集成的workspaces.nvim
  vim.keymap.set('n', '<leader><F4>', '<cmd>Telescope workspaces<CR>', opt)
end
-- 此外，建议配合安装以下两个命令行工具：
-- ripgrep: https://github.com/BurntSushi/ripgrep
-- fd: https://github.com/sharkdp/fd
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    set_keymap()
    -- workspaces.nvim 集成到telescope中
    require 'telescope'.load_extension('workspaces')
  end
}
