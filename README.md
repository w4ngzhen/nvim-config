# nvim config

## 环境准备

### 基本配置



- nodejs（[下载地址](https://nodejs.org/en/download/releases)）

- 一套支持各种图标的等宽字体：[Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/font-downloads)。

- 一个好用的跨平台的终端：[WezTerm](https://wezfurlong.org/wezterm/index.html)，我的WezTerm终端配置：[w4ngzhen/wezterm-config (github.com)](https://github.com/w4ngzhen/wezterm-config)。

#### Windows环境配置特别说明

Windows下安装nvim-treesitter需要通过C/C++编译器对各个语言tree-sitter模块进行原生代码编译。强烈建议通过Windows包管理器scoop安装llvm一套C/C++工具链，让nvim-tressitter编译的时候，使用llvm的clang进行平台相关的编译。（注意挂梯子）

- powershell（[下载地址](https://learn.microsoft.com/zh-cn/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)）

- 安装scoop（[官网地址](https://scoop.sh/#/)）

```powershell
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
> irm get.scoop.sh | iex
```

- 安装llvm

```powershell
scoop install main/llvm
```

### 语言服务端

#### lua语言服务器

```
下载并将lua语言服务添加到环境变量中：
https://github.com/LuaLS/lua-language-server/releases
```

#### TypeScript相关

```
npm install -g typescript typescript-language-server
```

#### HTML, JSON, CSS

```
npm install -g vscode-langservers-extracted
```

#### CSS模块化

```
npm install -g cssmodules-language-server
```

## 拉取nvim配置

macOS / Linux:

```
git clone https://github.com/w4ngzhen/nvim-config ~/.config/nvim
```

Windows CMD:

```cmd
git clone git@github.com:w4ngzhen/nvim-config.git %LocalAppData%\nvim
```

Windows Powershell:

```powershell
git clone git@github.com:w4ngzhen/nvim-config.git $env:LocalAppData\nvim
```

## 初始化

1. 打开nvim
2. 命令模式下输入`Lazy`
3. 等待插件安装（需要梯子保证网络连通性）
4. 使用！
