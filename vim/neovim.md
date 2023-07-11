# Neovim

- [neovim](https://github.com/neovim/neovim)
  - [install](https://github.com/neovim/neovim/wiki/Installing-Neovim)
    - [macports](https://github.com/neovim/neovim/wiki/Installing-Neovim#macports)
    - [ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
    - [rhel 8](https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8)
    - [freebsd](https://github.com/neovim/neovim/wiki/Installing-Neovim#freebsd)

## Install

```bash
# mac
sudo port install neovim

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
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo

# ubuntu / debian
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb

# others
sudo make install
```

---

## Package Manager

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [packer.nvim](https://github.com/wbthomason/packer.nvim)

---

## Plugins

### Color Schemes

- monokai
- [rose-pine/nvim](https://github.com/rose-pine/neovim)
