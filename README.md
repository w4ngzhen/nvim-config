# nvim config

## 环境准备

### 基本配置

- nodejs

- 一套支持各种图标的等宽字体：[Nerd Fonts - Iconic font aggregator, glyphs/icons collection, & fonts patcher](https://www.nerdfonts.com/font-downloads)。

- 一个好用的跨平台的终端：[WezTerm](https://wezfurlong.org/wezterm/index.html)，我的WezTerm终端配置：[w4ngzhen/wezterm-config (github.com)](https://github.com/w4ngzhen/wezterm-config)。

### 语言服务端

#### lua

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

## 安装nvim配置

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
