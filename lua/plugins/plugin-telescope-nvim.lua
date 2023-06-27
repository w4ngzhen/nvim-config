-- 插件相关快捷键配置
local function set_keymap()
    local builtin = require('telescope.builtin')
    local opt = { noremap = true }
    vim.keymap.set('n', '<F1>', builtin.find_files, opt)
    vim.keymap.set('n', '<F2>', builtin.grep_string, opt)
    vim.keymap.set('n', '<F3>', builtin.live_grep, opt) -- 依赖ripgrep
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
  config = function ()
    set_keymap()
  end
}
