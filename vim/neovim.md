# Neovim

- [neovim](https://github.com/neovim/neovim)
  - [install](https://github.com/neovim/neovim/wiki/Installing-Neovim)
    - [macports](https://github.com/neovim/neovim/wiki/Installing-Neovim#macports)
    - [ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
    - [rhel 8](https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8)
    - [freebsd](https://github.com/neovim/neovim/wiki/Installing-Neovim#freebsd)
  - docs
    - [initialization](https://neovim.io/doc/user/starting.html#initialization)

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

## Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)


```bash
mkdir -p ~/.config/nvim
vi ~/.config/nvim/init.lua
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
  - monokai
  - [rose-pine/nvim](https://github.com/rose-pine/neovim)
  - [Everblush/everblush.vim](https://github.com/Everblush/everblush.vim)
- File Explorer
  - [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua): [recipes](https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes), [tips](https://github.com/nvim-tree/nvim-tree.lua/wiki/Tips)
  - [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
