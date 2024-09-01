-- lsp增强插件
-- 前置：
-- 1. nvim-lspconfig+各种language server
-- 2. treesitter配置有markdown以及markdown_inline
--
return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({})
    -- 备注：在lspsaga的帮助下，可以不用在原本的lsp on_attach中绑定按键了
    require("keymap.keymap_lsp").setup()
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  }
}
