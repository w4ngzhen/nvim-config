# 我的lazy.nvim配置（一）

## init.lua

路径：stdpath("**config**")/init.lua

> stdpath("config")
>
> macOS/Linux：~/.config/nvim
>
> Windows：~/AppData/Local/nvim



```lua
-- bootstrap lazy.nvim
-- ./lua/lazynvim-init.lua
require("lazynvim-init")
```

意义作用：

nvim启动时会加载`init.lua`配置，然后通过`require("lazynvim-init")`查找当前`init.lua`所在目录下的lua目录下的`lazynvim-init.lua`文件，运行其内容。

## lazynvim-init.lua

路径：stdpath("**config**")/lua/lazynvim-init.lua

代码内容：

```lua
-- 1. 准备lazy.nvim模块（存在性检测）
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
-- 
-- 2. 将 lazypath 设置为运行时路径
-- rtp（runtime path）
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
-- 否则，下面 require("lazy") 是找不到的
vim.opt.rtp:prepend(lazypath)

-- 3. 加载lazy.nvim模块
require("lazy").setup({})
```

意义作用：

该配置文件主要有3部分组成：

1. lazy.nvim的加载与验证
2. 将lazy.nvim模块所在目录加入到lua模块搜索路径下
3. lazy.nvim加载插件

首先，lazy.nvim进行存在性检查，如果不存在，则通过git clone方式，下载对应的模块代码，并存放到`stdpath("data")/lazy/lazy.nvim`目录下。

> stdpath("data")路径为：
>
> macOS/Linux：~/.local/share/nvim
>
> Windows：~/AppData/Local/nvim-data

然后，`vim.opt.rtp:prepend(lazypath)`代码会将lazy.nvim模块所在的路径加入到运行时路径（runtimepath）下，只有配置了这行代码才能让下面`require("lazy")`执行的时候，能够从`lazypath`中搜索到lazy模块并加载。

在本人macOS机器上，翻看`~/.local/share/nvim/lazy/lazy.nvim`目录下，会看到：

```
$ cd ~/.local/share/nvim/lazy/lazy.nvim
$ tree -L 2
.
├── CHANGELOG.md
├── LICENSE
├── README.md
├── TODO.md
├── doc
├── lua（这里面还有目录lazy/init.lua文件）
├── selene.toml
├── stylua.toml
├── tests
└── vim.toml
```

搜索`lazy`模块的时候，会从`～/.local/share/nvim/lazy/lazy.nvim`目录下找到`lua/lazy/init.lua`进行加载。

如果不配置，会看到如下报错：

```
E5113: Error while calling lua chunk: /Users/w4ngzhen/.config/nvim/lua/lazynvim-init.lua:22: module 'lazy' not found:
        no field package.preload['lazy']
        no file './lazy.lua'
        no file '/usr/local/share/luajit-2.1.0-beta3/lazy.lua'
        no file '/usr/local/share/lua/5.1/lazy.lua'
        no file '/usr/local/share/lua/5.1/lazy/init.lua'
        no file './lazy.so'
        no file '/usr/local/lib/lua/5.1/lazy.so'
        no file '/usr/local/lib/lua/5.1/loadall.so'
```

最后，我们编写了一段代码，加载lazy模块：`require("lazy").setup({})`。注意，我们还没有让lazynvim加载任何的模块。

## 简单验证

我们的配置文件结构如下：

```
$ cd ~/.config/nvim
$ tree
.
├── README.md
├── init.lua
└── lua
    └── lazynvim-init.lua
```

运行nvim后，输入指令`:Lazy`：

