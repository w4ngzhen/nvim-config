# 克隆本项目到nvim配置目录

> Windows

```
cd ~/AppData/Local/nvim/
git clone git@github.com:w4ngzhen/nvim-config.git
```

>  Linux, Unix

```
cd ~/.config/nvim
git clone git@github.com:w4ngzhen/nvim-config.git
```

# 安装Packer.nvim

> Linux, Unix Shell

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

即：

```
~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

> Windows Powershell

```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

即：

```
~/AppData/Local/nvim-site/pack/packer/start/packer.nvim
```

# 初始化

同步所有插件

```
:PackerSync
```

加载LSP Server

```
:LspInstall
```

