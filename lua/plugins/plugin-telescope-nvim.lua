-- 插件相关快捷键配置
-- 此外，建议配合安装以下两个命令行工具：
-- ripgrep: https://github.com/BurntSushi/ripgrep
-- fd: https://github.com/sharkdp/fd
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('keymap.keymap_telesope').setup();
  end
}
