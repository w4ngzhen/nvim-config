vim.lsp.set_log_level("debug")
local lsp_keymap = require("lsp.lsp-keymap")
local config_tb = {
  require "lsp.lsconfig-lua",
  require "lsp.lsconfig-css",
  require "lsp.lsconfig-cssmodule",
  require "lsp.lsconfig-html",
  require "lsp.lsconfig-json",
  require "lsp.lsconfig-typescript",
}
--
for _, cfg in ipairs(config_tb) do
  local setup_config = cfg.setup_config
  -- 公共配置
  setup_config['on_attach'] = lsp_keymap.ls_on_attach

  require("lspconfig")[cfg.name].setup(setup_config)
end
