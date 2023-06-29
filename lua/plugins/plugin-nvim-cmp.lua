-- https://github.com/hrsh7th/nvim-cmp
local M = {
  -- nvim-cmp 补全核心插件，其余是补全数据来源
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  -- vsnip代码片段
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  -- https://github.com/rafamadriz/friendly-snippets
  -- 包含了大部分常用语言的代码段
  { 'rafamadriz/friendly-snippets' },
  -- 代码提示，显示分类的小图标支持。
  { 'onsails/lspkind-nvim' },
}

return M
