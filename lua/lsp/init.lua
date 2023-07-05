vim.lsp.set_log_level("debug")
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
  -- 增加格式化按键
  setup_config.on_attach = function (_, buf)
    vim.api.nvim_buf_set_keymap(buf, "n", "<C-M-l>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true })
  end
  require("lspconfig")[cfg.name].setup(setup_config)
end
