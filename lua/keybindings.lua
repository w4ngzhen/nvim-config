-- export
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}
-- 映射ctrl+z，防止卡死
map("n", "<C-z>", "", opt)
map("i", "<C-z>", "", opt)
map("v", "<C-z>", "", opt)

-- bufferline: left and right tab switch. ctrl+h, ctrl+l.
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)

-- splite: sp switch. alt + hjkl.
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- NvimTree
map('n', '<A-m>', ':NvimTreeToggle<CR>', opt)
