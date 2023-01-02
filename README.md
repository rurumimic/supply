# Start

Start my macbook

- [ubuntu](ubuntu.md)
- [redhat](redhat.md)

## Follow these steps

1. Computer Name
2. Finder
   - Preferneces: Side Menu
3. Keyboard
   - Function keys
   - Caps Lock → Control
   - Turn off auto
   - Shortcuts
4. Git
5. Terminal
   - Command Line Tools
   - Warp Terminal
   - Fig
   - MacPorts
   - Neovim
   - SpaceVim
   - GitHub CLI
   - Bat
   - Tree
   - delta
   - fzf
   - GNU Global
   - Universal Ctags
   - clang
6. Docker Desktop
7. Languages
   - Go
   - Node
   - Python
   - Rust
   - Markdown
8. Virtual Machine
   - Virtual Box
   - Vagrant

---

### Computer Name

**System Preferences** -> **Share**

Change my Computer Name

---

### Finder

#### Preferneces

1. Open Finder
2. Go to `Preferences`
3. Settings in `General` Tab
4. Settings in `Sidebar` Tab
6. Settings in `Advanced` Tab
   - [x] Show all filename extensions

---

### Trackpad

**System Preferences** -> **Trackpad**

Check all

### Keyboard

**System Preferences** -> **Keyboard**

#### (option) Function Keys

To use Text Editor(SpaceVim) conveniently

1. `Keyboard` Tab
   - [x] Use F1, F2, etc. keys as standard function keys

#### Modifiers Keys...

1. `Keyboard` Tab → `Modifiers Keys...`
2. `Caps Lock ⬆️` Key to `^ Control`

#### Turn off auto

1. `Text` Tab
2. Uncheck all

#### (option) Input Sources

1. `Shortcuts` Tab
2. `Input Sources`
   - `Control + Space` → `Command + Space`: Select the previous input source
   - `Control + Option + Space` → `Command + Option + Space`: Select next source in Input menu
3. `Spotlight`
   - `Commnad + Space` → `Option + Space`: Show spotlight search
   - `Commnad + Option + Space` → `Option + Control + Space`: Show Finder search window

---

## Git

git: 1.6 Getting Started - [First-Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor vi
git config --list
```

---

## Terminal

### Command Line Tools

```bash
echo $SHELL # /bin/zsh
xcode-select --install
```

### Warp Terminal

Install [warp](https://www.warp.dev)

### Fig

Install [fig](https://fig.io)

### MacPorts

Install [port](https://www.macports.org) with `pkg` installer

```bash
ls -al /opt/local/bin
```

Update:

```bash
sudo port selfupdate
```

### Neovim

- [Neovim](https://github.com/neovim/neovim)
  - [Install](https://github.com/neovim/neovim/wiki/Installing-Neovim) by [MacPorts](https://github.com/neovim/neovim/wiki/Installing-Neovim#macports)

```bash
sudo port install neovim
```

Add an alias to `~/.zsrhc`:

```bash
# alias
alias ll='ls -alh'
alias vi=nvim
# alias vim=nvim
```

### SpaceVim

- [SpaceVim](https://spacevim.org)
   - [Quick Start Guide](https://spacevim.org/quick-start-guide/)

Check `install.sh`

```bash
curl -sLf https://spacevim.org/install.sh | zsh -s -- -h
```

#### Install SpaceVim for neovim only

```bash
curl -sLf https://spacevim.org/install.sh | zsh -s -- --install neovim
```

#### Debug SpaceVim

```bash
space + b + m
:checkhealth
:SPDebugInfo!
```

#### Setting

`space + f + v + d`

Open: `vi ~/.SpaceVim.d/init.toml`

Add layers:

```toml
[[layers]]
name = 'git'

[[layers]]
name = 'VersionControl'
    
[[layers]]
name = 'lang#c'
enable_clang_syntax_highlight = true
```

[~/.SpaceVim/init.vim](#init.vim)

### GitHub CLI

- [GitHub CLI](https://cli.github.com)
   - GitHub: [cli/cli](https://github.com/cli/cli)

```bash
sudo port install gh
```

#### Login GitHub CLI

```bash
gh auth login
```

### Bat

- GitHub: [sharkdp/bat](https://github.com/sharkdp/bat)
   - Install by [port](https://github.com/sharkdp/bat#on-macos-via-macports)

```bash
sudo port install bat
```

### Tree

[tree](http://mama.indstate.edu/users/ice/tree/)

```bash
sudo port install tree
```

### delta

[delta](https://github.com/dandavison/delta)

```bash
sudo port install git-delta
git config --global core.pager delta
```

### fzf

[fzf](https://github.com/junegunn/fzf)

```bash
sudo port install fzf
```

```bash
Zsh
===

Append this line to ~/.zshrc to enable fzf keybindings for Zsh:

  source /opt/local/share/fzf/shell/key-bindings.zsh

Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:

  source /opt/local/share/fzf/shell/completion.zsh
```

### GNU Global

- GNU [Global](https://ports.macports.org/port/global/)
- SpaceVim [gtags](https://spacevim.org/layers/gtags/)

```bash
sudo port install global
```

Add lines to `~/.zsrhc`:

```bash
source /opt/local/share/fzf/shell/key-bindings.zsh # enable fzf keybindings
source /opt/local/share/fzf/shell/completion.zsh # enable fuzzy auto-completion
```

### Universal Ctags

- [Universal Ctags](https://ctags.io)

```bash
sudo port install universal-ctags
```

### (option) Clang

- pyenv issue
   - apple clang: [comment](https://github.com/pyenv/pyenv/issues/2143#issuecomment-1072032647)
   - bug: [](https://bugs.python.org/issue45405)

```bash
sudo port install clang-12
port select --list clang
port select --set clang mp-clang-12
```

install old python:

```bash
CC=/opt/local/bin/clang pyenv install 3.7.0
```

---

## My Codes

```bash
mkdir -p ~/code/github/rurumimic
```

---

## Docker Desktop

[docker desktop](https://www.docker.com/products/docker-desktop/)

---

## Languages

### Go

[rurumimic/golang/install.md](https://github.com/rurumimic/golang/blob/main/install.md)

- gvm
- go
- protobuf3
- spacevim [Go IDE](https://spacevim.org/use-vim-as-a-go-ide/)

### Node

#### Install NVM

- [nvm-sh/nvm](https://github.com/nvm-sh/nvm)
   - Install by [ports](https://ports.macports.org/port/nvm/)

```bash
sudo port install nvm

# ~/.zshrc
source /opt/local/share/nvm/init-nvm.sh

nvm --help
```

#### Install Node

```bash
nvm install --lts # v18+
nvm ls
node --version
npm --version
```

#### Setup Yarn

```bash
corepack enable
yarn --version # 1.22.19
```

##### Yarn v3

in project dir:

```bash
yarn set version stable
yarn --version # 3+
```

- spacevim [JS IDE](https://spacevim.org/use-vim-as-a-javascript-ide/)

### Python

#### Install Dependencies

pyenv: [wiki](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

```bash
sudo port selfupdate
sudo port upgrade outdated
sudo port install openssl readline sqlite3 xz zlib tcl sqlite3-tcl
```

#### Install pyenv

pyenv/pyenv: [installation](https://github.com/pyenv/pyenv#installation)

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
```

#### Install pyenv-virtualenv

pyenv/pyenv-virtualenv: [installation](https://github.com/pyenv/pyenv-virtualenv#installation)

```bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

#### Setup .zshrc

```bash
# ~/.zshrc
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

#### Download python

```bash
pyenv install --list
pyenv install 3.11.1
pyenv install 2.7.18
```

#### Global Python 3.11

[black](https://github.com/psf/black)

```bash
pyenv global 3.11.1
pip install --upgrade pip
pip install black
```

#### for nvim env

```bash
pyenv virtualenv 3.10.5 vim3
pyenv activate vim3
pip install --upgrade pip setuptools
pip install pynvim
```

```bash
pyenv virtualenv 2.7.18 vim2
pyenv activate vim2
pip install pynvim
```

```bash
pyenv which python

~/.pyenv/versions/vim2/bin/python
~/.pyenv/versions/vim3/bin/python
```

```bash
vi ~/.SpaceVim/init.vim

let g:python_host_prog='~/.pyenv/versions/vim2/bin/python'
let g:python3_host_prog='~/.pyenv/versions/vim3/bin/python'
```

```bash
# vi

:checkhealth
```

```bash
## Python 3 provider (optional)
  - INFO: pyenv: Path: ~/.pyenv/libexec/pyenv
  - INFO: pyenv: Root: ~/.pyenv
  - INFO: Using: g:python3_host_prog = "~/.pyenv/versions/vim3/bin/python"
  - INFO: Executable: ~/.pyenv/versions/vim3/bin/python
  - INFO: Python version: 3.11.1
  - INFO: pynvim version: 0.4.3
  - OK: Latest pynvim is installed.
```

### Rust

[rurumimic/rust](https://github.com/rurumimic/rust#install-by-rustup)

### Markdown

- spacevim [markdown layer](https://spacevim.org/layers/lang/markdown/)

---

## Virtual Machine

### VirtualBox

[Download](https://www.virtualbox.org/wiki/Downloads)

```bash
mkdir -p ~/vm/virtualbox
```

1. Preferences
2. Default machine folder: `~/vm/virtualbox`

### Vagrant

[Download](https://www.vagrantup.com/downloads)

---

## init.vim

```bash
Open: `vi ~/.SpaceVim/init.vim`
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
