return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(buf)
        require('keymap.keymap_gitsigns').setup(buf);
      end
    })
    -- nvim-scrollbar 配置，支持scrollbar显示git hunk信息
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
