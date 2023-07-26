return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup {
              -- 针对workspaces.nvim切换工作空间以后，NvimTree未更新的情况
              update_cwd = true
            }
        end
    }
}
