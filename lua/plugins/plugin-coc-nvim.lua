-- coc.nvim 插件相关配置
--
-- 插件相关快捷键配置
local function set_keymap()
  -- Some servers have issues with backup files, see #649
  vim.opt.backup = false
  vim.opt.writebackup = false

  -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
  -- delays and poor user experience
  vim.opt.updatetime = 300

  -- Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appeared/became resolved
  vim.opt.signcolumn = "yes"
  local keyset = vim.keymap.set
  -- Autocomplete
  function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- === ALT + 0~9 功能 ===
  -- ALT+1 查看定义
  keyset("n", "<M-1>", "<Plug>(coc-definition)", { silent = true })
  -- ALT+2 查看类型定义
  keyset("n", "<M-2>", "<Plug>(coc-type-definition)", { silent = true })
  -- ALT+3 查看实现
  keyset("n", "<M-3>", "<Plug>(coc-implementation)", { silent = true })
  -- ALT+4 查看引用
  keyset("n", "<M-4>", "<Plug>(coc-references)", { silent = true })
  -- ALT+5 待定
  --
  -- ALT+6 进行重命名
  keyset("n", "<M-6>", "<Plug>(coc-rename)", { noremap = true, silent = false })

  -- === 自定义指令 ===
  -- :Format 进行代码格式化
  vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

  -- Use Tab for trigger completion with characters ahead and navigate
  -- NOTE: There's always a completion item selected by default, you may want to enable
  -- no select by setting `"suggest.noselect": true` in your configuration file
  -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
  -- other plugins before putting this into your config
  local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
  keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
  keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

  -- Make <CR> to accept selected completion item or notify coc.nvim to format
  -- <C-g>u breaks current undo, please make your own choice
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
end
-- 
return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      set_keymap()
    end
  }
}
