# RHEL: Red Hat Enterprise Linux

- download: [Red Hat Enterprise Linux](https://developers.redhat.com/products/rhel/download)

## VirtualBox

### /etc/hosts on Host

```bash
sudo vi /etc/hosts

192.168.8.2 redhat
```

### Install

- name: `redhat8`
- iso: `rhel-8.7-x86_64-dvd.iso`
- unattended install
   - username == Host username
   - hostname: `redhat`
   - domain name: `macintosh.localhost`
- hardware
   - memory: `8192 MB`
   - cpu: `4`
- hard disk: `50 GB` VDI

### Host-only network

1. File → Tool → Network Manager
2. Add Host-only Network
   - Name: `RedhatNetwork`
   - Mask: `255.255.255.0`
   - Lower Bound: `192.168.8.1`
   - Upper Bound: `192.168.8.3`
4. Add Network Adapter: Host-only Network
5. IP: `192.168.8.2`

```bash
ssh redhat
ip addr

3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:a8:f4:ee brd ff:ff:ff:ff:ff:ff
    inet 192.168.8.2/24 brd 192.168.8.255 scope global dynamic noprefixroute enp0s8
       valid_lft 86365sec preferred_lft 86365sec
    inet6 fe80::1829:531b:8f5f:58db/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```

---

## Start

### sudo

```bash
su
usermod -aG wheel <USER>
```

### Subscription Manager

- article: [How to renew your Red Hat Developer Subscription for Red Hat Enterprise Linux](https://developers.redhat.com/articles/renew-your-red-hat-developer-program-subscription#how_to_re_register_for_your_red_hat_developer_subscription)
- redhat: [https://access.redhat.com/management](https://access.redhat.com/management)

1. **Disabled**: Simple content access for Red Hat Subscription Management
2. Get **Red Hat Developer Subscription for Individuals**

```bash
sudo subscription-manager remove --all
sudo subscription-manager unregister
sudo subscription-manager clean
sudo subscription-manager register
sudo subscription-manager refresh
sudo subscription-manager attach --auto

# sudo subscription-manager list --available
# sudo subscription-manager attach --pool=<POOL-ID>
```

#### locale

```bash
sudo dnf search locale ko
sudo dnf install -y glibc-langpack-ko
```

### EPEL: Extra Packages for Enterprise Linux

- doc: [epel](https://docs.fedoraproject.org/en-US/epel/)

```bash
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf update
```

### Recommended packages

#### zsh

install: [zsh on rhel](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#centosrhel)

```bash
sudo dnf install -y zsh
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
```

#### ohmyzsh

github: [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### development tools

```bash
sudo dnf groupinfo "Development Tools"
sudo dnf group install -y "Development Tools"
```

#### neofetch

```bash
sudo dnf install -y neofetch
```

#### bat

bat: [releases](https://github.com/sharkdp/bat/releases)

```bash
curl -fsSL -O https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
tar xzf bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
sudo mv bat-v0.22.1-x86_64-unknown-linux-gnu /opt/bat
rm -rf bat-v0.22.1-x86_64-unknown-linux-gnu

vi ~/.zshrc
alias bat="/opt/bat/bat"
```

#### tree

```bash
sudo dnf install -y tree
```

#### neovim

neovim: [install](https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8)

```bash
sudo dnf install -y neovim python3-neovim
```

```bash
# vi ~/.zshrc
alias ll='ls -alh'
alias vi=nvim
```

#### SpaceVim

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

---

## Languages

### Python

pyenv: [wiki](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

```bash
sudo dnf install -y make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel
```

#### Install pyenv

pyenv/pyenv: [installation](https://github.com/pyenv/pyenv#installation)

```bash
curl https://pyenv.run | zsh
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
pip install --upgrade pip setuptools
pip install black
```

#### for nvim env

```bash
pyenv virtualenv 3.11.1 vim3
pyenv activate vim3
pip install --upgrade pip setuptools
pip install pynvim
pyenv deactivate
```

```bash
pyenv virtualenv 2.7.18 vim2
pyenv activate vim2
pip install pynvim
pyenv deactivate
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

### Go

[rurumimic/golang/install.md](https://github.com/rurumimic/golang/blob/main/install.md)

- gvm
- go
- protobuf3
- spacevim [Go IDE](https://spacevim.org/use-vim-as-a-go-ide/)

### Node

#### Install NVM

- [nvm-sh/nvm](https://github.com/nvm-sh/nvm)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

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

### Rust

[rurumimic/rust](https://github.com/rurumimic/rust#install-by-rustup)

### Markdown

- spacevim [markdown layer](https://spacevim.org/layers/lang/markdown/)

---

## Neovim

### Debug SpaceVim

```bash
space + b + m
:checkhealth
:SPDebugInfo!
```

### init.toml

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

### init.vim

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
