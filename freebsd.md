# FreeBSD

## Network

### /etc/rc.conf

```bash
ifconfig_em1="inet 192.168.13.2 netmask 255.255.255.0"
```

## User

### su

```bash
pw group show -n wheel
# wheel:*:0:root

pw group mod -n wheel -m keanu

pw group show -n wheel
# wheel:*:0:root,keanu
```

## Packages

### ports

```bash
sudo portsnap fetch
sudo portsnap extract
```

```bash
sudo portsnap fetch
sudo portsnap update
```

### pkg

```bash
sudo pkg update -f
```

### git

```bash
sudo pkg install git
```

### zsh

```bash
sudo pkg install zsh
```

```bash
sudo chsh -s /usr/local/bin/zsh
chsh -s /usr/local/bin/zsh $USER
```

#### ohmyzsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### neofetch

install: [FreeBSD](https://github.com/dylanaraps/neofetch/wiki/Installation#freebsd)

```bash
sudo pkg install neofetch
```

### curl

```bash
sudo pkg install curl
```

### Python

#### pyenv

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

```bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
```

```bash
pyenv install -v 3.11.1
pyenv global 3.11.1
```

```bash
pip install --upgrade pip setuptools wheel
pip install black
```

#### for nvim env

```bash
pyenv virtualenv 3.11.1 vim3
pyenv activate vim3
pip install --upgrade pip setuptools wheel 
pip install pynvim
pyenv deactivate
```

```bash
pyenv virtualenv 2.7.18 vim2
pyenv activate vim2
pip install pynvim
pyenv deactivate
```

### Neovim

- [Neovim](https://github.com/neovim/neovim)
  - [Install](https://github.com/neovim/neovim/wiki/Installing-Neovim#freebsd)

```bash
sudo pkg install neovim
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

#### ~/.config/nvim

```bash
ln -s ~/.SpaceVim ~/.config/nvim
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


```lua
let g:python_host_prog='~/.pyenv/versions/vim2/bin/python'
let g:python3_host_prog='~/.pyenv/versions/vim3/bin/python'

" let g:clang_library_path='/usr/lib/llvm-14/lib'

call SpaceVim#end()

let project_dir = g:SpaceVim#plugins#projectmanager#current_root()

if filereadable("./cscope.out")
  cs add cscope.out
endif

if filereadable("./GTAGS")
  let $GTAGSROOT=project_dir
  let $GTAGSDBPATH=project_dir
endif
```

