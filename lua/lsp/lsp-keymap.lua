-- F2 查看各种信息（包括错误信息）
vim.keymap.set('n', '<F2>', vim.diagnostic.goto_next, { noremap = true })
local M = {}
M.ls_on_attach = function(_, buff_num)
  print("on_attach at" .. buff_num)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(buff_num, ...)
  end
  local opts = { noremap = true }
  -- quick fix
  buf_set_keymap('n', '<A-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- 格式化代码，与IDEA一致
  buf_set_keymap('n', '<C-A-l>', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
  -- 查看函数声明
  buf_set_keymap('n', '<F3>', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- 查看函数相关引用
  buf_set_keymap('n', '<F4>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- 查看函数帮助文档
  buf_set_keymap('n', '<F5>', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- rename
  buf_set_keymap('n', '<F6>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- 查看函数定义
  buf_set_keymap('n', '<F7>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
end
return M
