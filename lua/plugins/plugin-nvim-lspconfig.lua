return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- LspAttach的时候，设置对应buff的格式化keymap
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          vim.api.nvim_buf_set_keymap(buf, "n", "<C-M-l>", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true })
        end,
      })
      -- 下述的lsp.lsconfig-xxx，都是lsp文件夹下的各种文件
      local config_tb = {
        require "lsp/lsconfig-lua",
        require "lsp/lsconfig-css",
        require "lsp/lsconfig-cssmodule",
        require "lsp/lsconfig-html",
        require "lsp/lsconfig-json",
        require "lsp/lsconfig-typescript",
        require "lsp/lsconfig-rust",
      }
      --
      local lspconfig = require('lspconfig')
      for _, cfg in ipairs(config_tb) do
        -- 取到配置
        local setup_config = cfg.setup_config
        -- 为每一个语言服务进行setup
        lspconfig[cfg.name].setup(setup_config)
      end
    end
  }
}
