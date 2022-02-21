vim.g["nvim_tree_show_icons"] = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
vim.g["nvim_tree_icons"] = {
    default = "",
    symlink = "",
    git_icons = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },
    folder_icons = {
        arrow_open = "v",
        arrow_closed = ">",
        default = ">",
        open =  "v",
        empty = ">",
        empty_open = "v",
        symlink = ">",
        symlink_open = "v",
    },
  }

require'nvim-tree'.setup {
    -- 关闭文件时自动关闭
    auto_close = true,
}
