# vim

## neovim

- [neovim](https://github.com/neovim/neovim)
  - [install](https://github.com/neovim/neovim/wiki/Installing-Neovim)
    - [macports](https://github.com/neovim/neovim/wiki/Installing-Neovim#macports)
    - [ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
    - [rhel 8](https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8)
    - [freebsd](https://github.com/neovim/neovim/wiki/Installing-Neovim#freebsd)

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

Add an alias to `~/.zsrhc`:

```bash
# alias
alias ll='ls --color=auto -alFh'
alias vi=nvim
# alias vim=nvim
```

## SpaceVim

- [SpaceVim](https://spacevim.org)
  - [Quick Start Guide](https://spacevim.org/quick-start-guide/)
  - [Install Manually](https://spacevim.org/faq/#how-to-install-spacevim-manually)

Check `install.sh`

```bash
curl -sLf https://spacevim.org/install.sh | zsh -s -- -h
```

## Install SpaceVim

```bash
# for vim and neovim
curl -sLf https://spacevim.org/install.sh | zsh

# for neovim only
curl -sLf https://spacevim.org/install.sh | zsh -s -- --install neovim

# without fonts
curl -sLf https://spacevim.org/install.sh | zsh -s -- --no-fonts --install neovim
```

### Optional Setup

```bash
ln -s ~/.SpaceVim ~/.vim
ln -s ~/.SpaceVim ~/.config/nvim
```

#### Fonts on RedHat

```bash
sudo mkdir -p /usr/share/fonts/opentype
sudo git clone https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/source-code-pro
sudo fc-cache -f -v
```

```bash
curl -sLfO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/SourceCodePro.zip
unzip SourceCodePro.zip -d patched-fonts

curl -O https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh
chmod +x install.sh
./install.sh
```

### Debug SpaceVim

```bash
space + b + m
:checkhealth
:SPDebugInfo!
```

### Setting SpaceVim

full code: [config/vim/init.toml](config/vim/init.toml)

in SpaceVim: `space + f + v + d`

```bash
vi ~/.SpaceVim.d/init.toml
```

### Setting NeoVim

full code: [config/vim/init.vim](config/vim/init.vim)

```bash
vi ~/.SpaceVim/init.vim
```

```lua
let g:python_host_prog='~/.pyenv/versions/vim2/bin/python'
let g:python3_host_prog='~/.pyenv/versions/vim3/bin/python'

let g:clang_library_path='/usr/lib/llvm-14/lib'

let project_dir = g:SpaceVim#plugins#projectmanager#current_root()

if filereadable("./cscope.out")
  cs add cscope.out
endif

if filereadable("./GTAGS")
  let $GTAGSROOT=project_dir
  let $GTAGSDBPATH=project_dir
endif
```

---

Optional:

```lua
set clipboard+=unnameplus
```