
local M = {};

function M.setup()
  local builtin = require('telescope.builtin')
  local opt = { noremap = true }
  vim.keymap.set('n', '<leader><F1>', builtin.find_files, opt)
  vim.keymap.set('n', '<leader><F2>', builtin.live_grep, opt) -- 依赖ripgrep
  vim.keymap.set('n', '<leader><F3>', builtin.grep_string, opt)
end

return M
