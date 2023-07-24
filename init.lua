-- disable netrw at the very start of your init.lua
-- netrw 有很多的BUG，提前禁用
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- 使用空格键来作为leader键
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- basic nvim config.
require("basic")
-- bootstrap lazy.nvim
-- ./lua/lazynvim-init.lua
require("lazynvim-init")
-- 加载 ./lua/code-cmp 代码补全功能
-- require该模块以前，需要保证lazynvim管理的有关cmp的插件加载完成
-- 只要放在 require('lazynvim-init')就能满足
require("code-cmp")
