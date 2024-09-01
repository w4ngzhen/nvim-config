return {
  'kevinhwang91/nvim-hlslens',
  config = function()
    -- require('hlslens').setup() is not required
    -- scrollbar来调用hlslens
    require("scrollbar.handlers.search").setup({
      -- hlslens config overrides
    })
    require('keymap.keymap_hl').setup();
  end
}
