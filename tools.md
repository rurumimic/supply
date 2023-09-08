# CLI Tools

## shell

### zsh

- [zsh](https://www.zsh.org/)
- ohmyzsh/wiki: [RHEL](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#centosrhel)

```bash
# ubuntu
sudo apt install zsh
# autoload -Uz zsh-newuser-install
# zsh-newuser-install -f
chsh -s /usr/bin/zsh
# vagrant password is vagrant

# redhat
sudo dnf install -y zsh
sudo chsh -s $(which zsh) # root
chsh -s $(which zsh)      # user


# freebsd
sudo pkg install zsh

sudo chsh -s /usr/local/bin/zsh  # root
chsh -s /usr/local/bin/zsh $USER # user
```

### ohmyzsh

- [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Theme

- [typewritten](https://typewritten.dev/#/installation?id=oh-my-zsh)

```bash
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten

# (option: create symlinks)
# ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
# ln -s "$ZSH_CUSTOM/themes/typewritten/async.zsh" "$ZSH_CUSTOM/themes/async"
```

```bash
# ~/.zshrc

ZSH_THEME="typewritten/typewritten"

# (option: create symlinks)
# ZSH_THEME="typewritten"
```

```bash
# ~/.zprofile, ~/.zshenv

# typewritten
export TYPEWRITTEN_SYMBOL="λ"
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_PROMPT_LAYOUT="pure_verbose"
export TYPEWRITTEN_RELATIVE_PATH="home"
# export TYPEWRITTEN_RELATIVE_PATH="adaptive"
```

result:

```bash
user@host ~/code/github/repo.git -> master + »
λ 
```

### noefetch

- [dylanaraps/neofetch](https://github.com/dylanaraps/neofetch)
  - [neofetch/wiki](https://github.com/dylanaraps/neofetch/wiki/)
  - [macports](https://ports.macports.org/port/neofetch/)

```bash
# mac
sudo port install neofetch

# ubuntu
sudo apt install neofetch

# redhat
sudo dnf install neofetch

# freebsd
sudo pkg install neofetch
```

- ascii arts: [neofetch/ascii](neofetch/ascii)
- [neofetch/config.conf](neofetch/config.conf)

### highlight

- [andre-simon.de](http://www.andre-simon.de/index.php)

```bash
# mac
sudo port install highlight

# ubuntu
sudo apt install highlight

# freebsd
sudo pkg install highlight
```

---

## Packages

### developer tool kit

- mac: command line tools
- ubuntu: build essential
- redhat: development tools

```bash
# mac
xcode-select --install


# ubuntu
sudo apt update
sudo apt install build-essential


# redhat
sudo dnf groupinfo "Development Tools"
sudo dnf group install -y "Development Tools"
```

### git

- [git](https://git-scm.com)

```bash
# mac
sudo port install git
```

#### global gitignore

- [.gitignore](https://www.toptal.com/developers/gitignore?templates=vim,emacs,linux,macos,windows,visualstudiocode,tags)
- [subfuzion/global-gitignore.md](https://gist.github.com/subfuzion/db7f57fff2fb6998a16c)

```bash
vi ~/.gitignore
git config --global core.excludesfile ~/.gitignore
```

### bat

- GitHub: [sharkdp/bat](https://github.com/sharkdp/bat)
  - [releases](https://github.com/sharkdp/bat/releases)
  - [macports](https://github.com/sharkdp/bat#on-macos-via-macports)

```bash
# mac
sudo port install bat
```

#### bat on ubuntu

```bash
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

#### bat on redhat

```bash
curl -fsSL -O https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
tar xzf bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
sudo mv bat-v0.22.1-x86_64-unknown-linux-gnu /opt/bat
rm -rf bat-v0.22.1-x86_64-unknown-linux-gnu
```

```bash
vi ~/.zshrc
alias bat="/opt/bat/bat"
```

#### bat on freebsd

```bash
sudo pkg install bat
```

### tree

- [tree](http://mama.indstate.edu/users/ice/tree/)

```bash
# mac
sudo port install tree

# ubuntu
sudo apt install tree

# redhat
sudo dnf install tree

# freebsd
sudo pkg install tree
```

### fzf

- [fzf](https://github.com/junegunn/fzf)

```bash
# mac
sudo port install fzf

# ubuntu
sudo apt install fzf

# freebsd
sudo apt install fzf
```

Add lines to `~/.zsrhc`:

```bash
# mac
source /opt/local/share/fzf/shell/key-bindings.zsh # enable fzf keybindings
source /opt/local/share/fzf/shell/completion.zsh # enable fuzzy auto-completion

# ubuntu
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# freebsd
source /usr/local/share/examples/fzf/shell/key-bindings.zsh
source /usr/local/share/examples/fzf/shell/completion.zsh
```

```bash
# ~/.zshrc
plugins=(git fzf)

export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
```

### fd

- fd: [installation](https://github.com/sharkdp/fd#installation)
  - [releases](https://github.com/sharkdp/fd/releases)

```bash
# mac
sudo port install fd

# ubuntu
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd


# redhat
# https://github.com/sharkdp/fd/releases
tar xf fd-v*-x86_64-unknown-linux-gnu.tar.gz
sudo chown -R root:root fd-v*-x86_64-unknown-linux-gnu
sudo cd fd-v*-x86_64-unknown-linux-gnu

sudo mkdir -p /opt/fd/bin
sudo cp fd /opt/fd/bin/fd
sudo ln -s /opt/fd/bin/fd /usr/local/bin

sudo gzip fd.1
sudo chown root:root fd.1.gz
sudo cp fd.1.gz /usr/share/man/man1
sudo cp autocomplete/fd.bash /usr/share/bash-completion/completions/fd
source /usr/share/bash-completion/completions/fd
fd


# freebsd
sudo pkg install fd-find
```

### ripgrep

- ripgrep: [install](https://github.com/BurntSushi/ripgrep#installation)

```bash
# mac
sudo port install ripgrep

# ubuntu
sudo apt install ripgrep

# redhat
sudo dnf install ripgrep

# freebsd
sudo pkg install ripgrep
```

### clang

- [llvm](https://llvm.org)
  - [github](https://github.com/llvm/llvm-project)
  - clang: [get started](https://clang.llvm.org/get_started.html)
- install
  - [ubuntu](https://apt.llvm.org/)
- lldb
  - [code sign](https://lldb.llvm.org/resources/build.html#code-signing-on-macos)

```bash
# mac
sudo port install clang-16 llvm-16 lldb-16

ls /opt/local/libexec/llvm-16/bin

sudo port select --list llvm
sudo port select --list clang

sudo port select --set llvm mp-llvm-16
sudo port select --set clang mp-clang-16

sudo ln -s $(which clangd-mp-16) /opt/local/bin/clangd
sudo ln -s $(which lldb-mp-16) /opt/local/bin/lldb

llc --version
clang --version
clangd --version
lldb --version

# Code Signing on macOS
/opt/local/libexec/llvm-16/scripts/lldb/macos-setup-codesign.sh
sudo codesign --force --deep \
--preserve-metadata=identifier,entitlements,requirements,flags,team-identifier \
--sign lldb_codesign /opt/local/libexec/llvm-16/bin/lldb-server

# redhat
sudo dnf install llvm-toolset

# ubuntu: llvm 17
echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" | sudo tee -a /etc/apt/sources.list.d/llvm.list
echo "deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy main" | sudo tee -a /etc/apt/sources.list.d/llvm.list
sudo aptitude update
sudo apt install clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm python3-clang
## wasm
### sudo apt install libclang-rt-17-dev-wasm32 libclang-rt-17-dev-wasm64 libc++-17-dev-wasm32 libc++abi-17-dev-wasm32
```

#### link clang

- [update alternatives](https://gist.github.com/junkdog/70231d6953592cd6f27def59fe19e50d)

### cmake

- [cmake](https://cmake.org)
  - [install](https://cmake.org/install/)

```bash
# mac
sudo port install cmake

# redhat
sudo dnf install cmake

# ubuntu
sudo apt install cmake

# freebsd
sudo pkg install cmake
```

### ninja

- [ninja](https://ninja-build.org)
  - [github](https://github.com/ninja-build/ninja)
  - [install](https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages)

```bash
# mac
sudo port install ninja

# freebsd
sudo port install ninja
```

### GNU Global

- GNU Global
  - [download](https://www.gnu.org/software/global/download.html)
  - ftp: [global](https://ftp.gnu.org/pub/gnu/global/)
  - [macports](https://ports.macports.org/port/global)

```bash
# mac
sudo port install global

# ubuntu
sudo apt install global

# redhat
wget https://ftp.gnu.org/pub/gnu/global/global-*.tar.gz
tar xf global-*.tar.gz
cd global-*
./configure --prefix=/opt/global
make
sudo make install
```

### cscope

- [cscope](https://cscope.sourceforge.net/)

```bash
# ubuntu
sudo apt install cscope

# redhat
sudo dnf install cscope
```

### Universal Ctags

- [universal-ctags/ctags](https://github.com/universal-ctags/ctags)

```bash
# mac
sudo port install universal-ctags
```

#### Ctags on RedHat

```bash
sudo mkdir /opt/ctags

git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure --prefix=/opt/ctags # defaults to /usr/local
make
sudo make install # may require extra privileges depending on where to install
```

```bash
# ~/.zshrc
export PATH="/opt/ctags/bin:$PATH"
```

### Astyle

- [astyle](https://astyle.sourceforge.net/)
- vscode: [astyle](https://marketplace.visualstudio.com/items?itemName=chiehyu.vscode-astyle)

```bash
# ubuntu
sudo apt install astyle
```

### GDB

- [gdb](https://www.sourceware.org/gdb/)

```bash
# mac
sudo port install gdb
```

### Bear

- [Build EAR](https://github.com/rizsotto/Bear)

```bash
# ubuntu
sudo apt insatll bear
```

```bash
bear -- make

vi compile_commands.json
```

---

## git

```bash
# ubuntu
sudo apt install git

# freebsd
sudo pkg install git
```

### config

- git: 1.6 Getting Started - [First-Time Git Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
- github → settings → [emails](https://github.com/settings/emails)
- ref: [vim.md#edit-gitconfig](vim/README.md#edit-gitconfig)

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
#git config --global core.editor vi
git config --global core.editor nvim # /usr/bin/nvim
git config --list
```

### github cli

- [cli.github.com](https://cli.github.com/)
  - [cli/cli](https://github.com/cli/cli)
  - Installing gh on Linux and BSD
  - [debian, ubuntu, raspberry pi](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt)
  - [fedora, centos, redhat](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#fedora-centos-red-hat-enterprise-linux-dnf)
  - [freebsd](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#freebsd)

```bash
# mac
sudo port install gh

# ubuntu
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

# redhat
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh

# freebsd
sudo pkg install gh
```

#### Login GitHub CLI

```bash
gh auth login
```

---

## terminal

### kitty

- kitty/[install](https://sw.kovidgoyal.net/kitty/binary/)

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

- mac: `/Applications/kitty.app`
- linux: `~/.local/kitty.app`

#### kitty configuration

- mac: `cmd + ,`
- linux: `ctrl+shift+f2`

```bash
font_family Hack

map alt+c copy_to_clipboard
map alt+v paste_from _clipboard
```

#### Desktop integration on Linux

```bash
# linux
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```

#### Icon

- kitty: [icon](https://sw.kovidgoyal.net/kitty/faq/#i-do-not-like-the-kitty-icon)
- [DinkDonk/kitty-icon](https://github.com/DinkDonk/kitty-icon)

```bash
# mac
## 1. Find `kitty.app` in the `Applications folder`, select it and press `⌘ cmd + i`.
## 2. Drag `kitty-dark.icns` or `kitty-light.icns` onto the application icon in the `kitty info` pane.
## 3. Delete the icon cache and restart Dock:
rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock

# linux
## ~/.local/kitty.app/share/icons/hicolor/256x256/apps
cd ~/.local/kitty.app/lib/kitty/logo
kitty +runpy 'from kitty.fast_data_types import cocoa_set_app_icon; import sys; cocoa_set_app_icon(*sys.argv[1:]); print("OK")' kitty.png
```

#### Kitty Remote SSH with vagrant

[config/kitty-vagrant.sh](/config/kitty-vagrant.sh)

```bash
vsh() {
  if [ ! -f Vagrantfile ]; then
    echo -e "\e[31mThere is no 'Vagrantfile' here.\e[0m" >&2
    return 1
  fi
  if [ ! -d .vagrant ]; then
    echo -e "\e[31mThere is no '.vagrant/' here.\e[0m" >&2
    return 1
  fi
  if [ ! -f .vagrant/ssh-config ]; then
    vagrant ssh-config > .vagrant/ssh-config
  fi
  kitty +kitten ssh -F .vagrant/ssh-config "${1:-default}"
}
```

#### Kitty Remote SSH with terminfo

Save in `.terminfo`:

```bash
infocmp -a xterm-kitty > xterm-kitty
```

Apply to remote server:

```bash
tic -x -o ~/.terminfo xterm-kitty
```

Stored in `~/.terminfo/x/xterm-kitty`

### warp

- [warp](https://www.warp.dev/)
  - [custom themes](https://docs.warp.dev/appearance/custom-themes#how-do-i-use-a-custom-theme-in-warp)
- themes: [wapr-theme](https://github.com/austintraver/warp-theme)
  - [monoka pro](https://github.com/austintraver/warp-theme/blob/main/monokai_pro.yaml)

```bash
mkdir -p ~/.warp/themes/
vi ~/.warp/themes/monokai_pro.yaml
```

### fig

- [fig](https://fig.io/)

### alacritty

- [alacritty](https://github.com/alacritty/alacritty)
  - [releases](https://github.com/alacritty/alacritty/releases)

```bash
cargo install alacritty

# ubuntu
curl -L -O https://github.com/alacritty/alacritty/releases/download/v0.12.2/Alacritty.desktop
sudo desktop-file-install Alacritty.desktop

curl -L -O https://github.com/alacritty/alacritty/releases/download/v0.12.2/Alacritty.svg
sudo cp Alacritty.svg /usr/share/pixmaps/Alacritty.svg
sudo update-desktop-database
```

#### alacritty.yml

```bash
mkdir -p ~/.config/alacritty
curl -L -o ~/.config/alacritty/alacritty.yml https://github.com/alacritty/alacritty/releases/download/v0.12.2/alacritty.yml
```

```yml
window:
 dimensions:
    columns: 140
    lines: 40
font:
  normal:
   family: Hack Nerd Font
```

### tmux

> kovidgoyal: [do not use terminal multiplexers](https://sw.kovidgoyal.net/kitty/faq/#i-am-using-tmux-and-have-a-problem)

- [tmux](https://github.com/tmux/tmux)
  - [wiki](https://github.com/tmux/tmux/wiki)
- [tmux plugins manager](https://github.com/tmux-plugins/tpm)
  - [plugins](https://github.com/tmux-plugins/list)

```bash
# mac
sudo port install tmux

# ubuntu
sudo apt install tmux
```

#### tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```bash
mkdir -p ~/.config/tmux
vi ~/.config/tmux/tmux.conf
```

```bash
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'github_username/plugin_name#branch'
# set -g @plugin 'git@github.com:user/plugin'
# set -g @plugin 'git@bitbucket.com:user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
```

```bash
tmux
```

#### ohmyzsh plugin

- ohmyzsh/plugins/[tmux](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/tmux/README.md)

```bash
plugins=(git fzf tmux)
```

