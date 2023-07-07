-- null-ls.nvim是基于nvim-lsconfig的扩展
-- 扩展了某些编程语言本身以外的格式化、代码分析（prettier、eslint等）
-- 具体意义就是，
-- 我们可以通过nvim-lsconfig结合语言服务来对某个代码文件或工程进行代码结构的分析（类型、语法检查）
-- 但是，某些代码本身的语法没有问题，能够通过编译，不代表其是最佳实践（命名规范、调用规范等）
-- 对于这些场景，语言服务本身没有过多的关注，null-ls就补齐了这一点。
--
-- null-ls 插件本身
local null_ls_core = {
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    require('null-ls').setup({
      on_attach = function(client, buf)
        if client.supports_method("textDocument/formatting") then
          vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = buf, desc = "[lsp] format" })
        end
        if client.supports_method("textDocument/rangeFormatting") then
          vim.keymap.set("x", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
          end, { buffer = buf, desc = "[lsp] format" })
        end
      end
    })
  end,
  dependencies = {
    'neovim/nvim-lspconfig'
  }
}
-- 基于 null-ls 的prettier
local null_ls_prettier = {
  'MunifTanjim/prettier.nvim',
  config = function()
    require('prettier').setup({
      -- 最好全局安装prettier
      -- npm install -g prettier
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    })
  end,
  dependencies = {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  }
}
-- 基于 null-ls 的eslint
local null_ls_eslint = {
  "MunifTanjim/eslint.nvim",
  config = function()
    require("eslint").setup({
      -- 最好全局安装eslint
      -- npm install -g eslint
      bin = 'eslint', -- or `eslint_d`
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { "directive", "problem", "suggestion", "layout" },
        },
        disable_rule_comment = {
          enable = true,
          location = "separate_line", -- or `same_line`
        },
      },
      diagnostics = {
        enable = true,
        report_unused_disable_directives = false,
        run_on = "type", -- or `save`
      },
    })
  end,
  dependencies = {
    'neovim/nvim-lspconfig',
    'jose-elias-alvarez/null-ls.nvim',
  }
}
--  按顺序
return {
  null_ls_core,
  null_ls_prettier,
  null_ls_eslint
}
