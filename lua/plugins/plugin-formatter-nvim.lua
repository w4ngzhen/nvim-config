return {
  "mhartington/formatter.nvim",
  config = function()
    local filetype_config = {}
    -- 前端format
    local ft_names = {
      "html",
      "css",
      "json",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    }
    for _, ft_name in ipairs(ft_names) do
      filetype_config[ft_name] = {
        -- 上述的filetype，都直接使用对应目录下的preitter
        require("formatter.filetypes." .. ft_name).prettier
      }
    end
    -- c/cpp format
    local clang_format = {
      require("formatter.filetypes.cpp").clangformat
    }
    filetype_config.c = {
      clang_format,
    }
    filetype_config.cpp = {
      clang_format,
    }
    require('formatter').setup({
      filetype = filetype_config
    })
    require('keymap.keymap_formatter').setup_keymap_for_formatter();
  end
}
