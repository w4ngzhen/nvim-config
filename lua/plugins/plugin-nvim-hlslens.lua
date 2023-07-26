return {
  'kevinhwang91/nvim-hlslens',
  config = function()
    -- require('hlslens').setup() is not required
    -- scrollbar来调用hlslens
    require("scrollbar.handlers.search").setup({
      -- hlslens config overrides
    })
    local keymap_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', 'n',
      [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
      keymap_opts)
    vim.api.nvim_set_keymap('n', 'N',
      [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
      keymap_opts)
    vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], keymap_opts)
    vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], keymap_opts)
    vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], keymap_opts)
    vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], keymap_opts)

    vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', keymap_opts)
  end
}
