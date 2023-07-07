-- disable netrw at the very start of your init.lua
-- netrw 有很多的BUG，提前禁用
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- basic nvim config.
require("basic")
-- bootstrap lazy.nvim
-- ./lua/lazynvim-init.lua
require("lazynvim-init")
-- lsp
require("lsp")
require("lsp/cmp")
