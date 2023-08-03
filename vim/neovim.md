# Neovim

- [neovim](https://github.com/neovim/neovim)
  - [install](https://github.com/neovim/neovim/wiki/Installing-Neovim)
    - [macports](https://github.com/neovim/neovim/wiki/Installing-Neovim#macports)
    - [ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
    - [rhel 8](https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8)
    - [freebsd](https://github.com/neovim/neovim/wiki/Installing-Neovim#freebsd)
  - docs
    - [initialization](https://neovim.io/doc/user/starting.html#initialization)
- [neovimcraft](https://neovimcraft.com)

## Prerequisites

- git, cc
- python, node
- unzip, wget, curl, gzip, tar, bash, sh, ripgreg, fd, fzf

## Install

```bash
# mac
sudo port install neovim

# ubuntu
sudo apt install neovim

# redhat (epel)
sudo dnf install neovim python3-neovim

# freebsd
sudo pkg install neovim
```

Add an alias to `~/.zshrc`:

```bash
# alias
alias ll='ls --color=auto -alFh'
alias vi='nvim'
# alias vim='nvim'
```

### Install from source

- neovim: [Install from source](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source)

#### Build prerequisites

```bash
# ubuntu / debian
sudo apt-get install ninja-build gettext cmake unzip curl

# centos / rhel / fedora
sudo dnf -y install ninja-build cmake gcc make unzip gettext curl

# arch
sudo pacman -S base-devel cmake unzip ninja curl

# freebsd
sudo pkg install cmake gmake sha unzip wget gettext curl

# mac
sudo port install ninja cmake gettext
```

#### Build Neovim

```bash
git clone https://github.com/neovim/neovim
cd neovim

# make CMAKE_BUILD_TYPE=RelWithDebInfo
# or
git checkout stable
make CMAKE_BUILD_TYPE=Release

# ubuntu / debian
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# other linux
sudo make install
```

#### Remove Neovim

```bash
sudo dpkg -l neovim
sudo dpkg -P neovim
```

---

## NvChad

- [NvChad/NvChad](https://github.com/NvChad/NvChad)

my [.config/nvim/lua/custom](https://github.com/rurumimic/nvim)

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
cd $HOME/.config/nvim/lua/
rm -rf custom
git clone https://github.com/rurumimic/nvim custom
```

---

## Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)


```bash
mkdir -p ~/.config/nvim
```

### lazy.nvim

```bash
mkdir -p ~/.config/nvim/lua/plugins
```

#### bootstrap lazy.nvim

```bash
vi ~/.config/nvim/init.lua
```

```lua
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

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
vim.opt.rtp:prepend(lazypath)
```

#### setup lazy.nvim

```bash
vi ~/.config/nvim/init.lua
```

```lua
require("lazy").setup("plugins")
```

#### Check lazy.nvim

```bash
:checkhealth lazy
```

#### data location

```bash
ls ~/.local/share/nvim/lazy
```

#### Key

```bash
:Lazy home
```

---

## Plugins

```bash
vi ~/.config/nvim/lua/plugins/<name>.lua
```

```lua
return {
  "user/plugin",
  version = "*",
  lazy = false,
  dependencies = {},
  config = function()
    require("plugin").setup {}
  end,
}
```

- Color Schemes
  - [loctvl842/monokai-pro.nvim](https://github.com/loctvl842/monokai-pro.nvim)
  - [rose-pine/nvim](https://github.com/rose-pine/neovim)
  - [Everblush/everblush.vim](https://github.com/Everblush/everblush.vim)
- File Explorer
  - [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): [recipes](https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes), [tips](https://github.com/nvim-tree/nvim-tree.lua/wiki/Tips)
  - [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
- Fuzzy Finder
  - [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - require: [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep), CMake
- Syntax
  - [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Keybinding
  - [folke/which-key.nvim](https://github.com/folke/which-key.nvim)
- Statusline
  - [nvimdev/galaxyline.nvim](https://github.com/nvimdev/galaxyline.nvim)
  - [rebelot/heirline.nvim](https://github.com/rebelot/heirline.nvim)
  - [ojroques/nvim-hardline](https://github.com/ojroques/nvim-hardline)
- Buffeline
  - [crispgm/nvim-tabline](https://github.com/crispgm/nvim-tabline)
- Cursorline
  - [yamatsum/nvim-cursorline](https://github.com/yamatsum/nvim-cursorline)
- Git
  - [f-person/git-blame.nvim](https://github.com/f-person/git-blame.nvim)
  - [NeogitOrg/neogit](https://github.com/NeogitOrg/neogit)
  - [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
- Language Server Protocol
  - [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  - [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
- Debug Adapter Protocol
  - [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)
  - [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- Linters
  - [jose-elias-alvarez/null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
  - [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)
- Formatters
  - [mhartington/formatter.nvim](https://github.com/mhartington/formatter.nvim)

