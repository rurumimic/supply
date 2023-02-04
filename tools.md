# CLI Tools

## shell

### zsh

- [zsh](https://www.zsh.org/)
- ohmyzsh/wiki: [RHEL](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#centosrhel)

```bash
# ubuntu
sudo apt install zsh

autoload -Uz zsh-newuser-install
zsh-newuser-install -f

chsh -s /usr/bin/zsh


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
ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
ln -s "$ZSH_CUSTOM/themes/typewritten/async.zsh" "$ZSH_CUSTOM/themes/async"
```

```bash
# ~/.zshrc

ZSH_THEME="typewritten"
```

```bash
# ~/.zprofile

# typewritten
export TYPEWRITTEN_SYMBOL="λ"
export TYPEWRITTEN_CURSOR="block"
export TYPEWRITTEN_RELATIVE_PATH="adaptive"
# export TYPEWRITTEN_PROMPT_LAYOUT="singleline_verbose"
export TYPEWRITTEN_PROMPT_LAYOUT="pure_verbose"
export TYPEWRITTEN_LEFT_PROMPT_PREFIX_FUNCTION=(date +%H:%M:%S)
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

### tree

- [tree](http://mama.indstate.edu/users/ice/tree/)

```bash
# mac
sudo port install tree

# ubuntu
sudo apt install tree

# redhat
sudo dnf install tree
```

### fzf

- [fzf](https://github.com/junegunn/fzf)

```bash
# mac
sudo port install fzf

# ubuntu
sudo apt install fzf

# redhat

```

```bash
Zsh
===

Append this line to ~/.zshrc to enable fzf keybindings for Zsh:

  source /opt/local/share/fzf/shell/key-bindings.zsh

Append this line to ~/.zshrc to enable fuzzy auto-completion for Zsh:

  source /opt/local/share/fzf/shell/completion.zsh
```

Add lines to `~/.zsrhc`:

```bash
source /opt/local/share/fzf/shell/key-bindings.zsh # enable fzf keybindings
source /opt/local/share/fzf/shell/completion.zsh # enable fuzzy auto-completion
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
```

### ripgrep

- ripgrep: [install](https://github.com/BurntSushi/ripgrep#installation)

```bash
# ubuntu
sudo apt install ripgrep

# redhat
sudo dnf install ripgrep
```

### delta

- [delta](https://github.com/dandavison/delta)
  - [install](https://dandavison.github.io/delta/installation.html)
  - [releases](https://github.com/dandavison/delta/releases)

```bash
# mac
sudo port install git-delta

# ubuntu
dpkg -i git-delta_0.15.1_amd64.deb 

# redhat
tar xf delta-*-x86_64-unknown-linux-musl.tar.gz
cd delta-*-x86_64-unknown-linux-musl

sudo mkdir -p /opt/delta/bin
sudo cp delta /opt/delta/bin/delta
sudo ln -s /opt/delta/bin/delta /usr/local/bin
```

1. install [git](#git)
2. edit: [~/.gitconfig](config/gitconfig)

git diff: `git lg -n 5`

### clang

- [llvm](https://llvm.org)
  - [github](https://github.com/llvm/llvm-project)
  - clang: [get started](https://clang.llvm.org/get_started.html)

```bash
# mac
sudo port install clang-14

ls /opt/local/libexec/llvm-14/bin

sudo port select --list llvm
sudo port select --list clang

sudo port select --set llvm mp-llvm-14
sudo port select --set clang mp-clang-14

llc --version
clang --version


# redhat
sudo dnf install llvm-toolset
```

### cmake

- [cmake](https://cmake.org)
  - [install](https://cmake.org/install/)

```bash
# mac
sudo port install cmake

# redhat
sudo dnf install cmake
```

### ninja

- [ninja](https://ninja-build.org)
  - [github](https://github.com/ninja-build/ninja)
  - [install](https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages)

```bash
# mac
sudo port install ninja
```

### GNU Global

- GNU Global
  - [download](https://www.gnu.org/software/global/download.html)
  - ftp: [global](https://ftp.gnu.org/pub/gnu/global/)
  - [macports](https://ports.macports.org/port/global)
- SpaceVim [gtags](https://spacevim.org/layers/gtags/)

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

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor vi
git config --list
```

1. install [delta](#delta)
2. edit: [~/.gitconfig](config/gitconfig)

git diff: `git lg -n 5`

### github cli

- [cli.github.com](https://cli.github.com/)
  - [cli/cli](https://github.com/cli/cli)
  - Installing gh on Linux and BSD
  - [debian, ubuntu, raspberry pi](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-raspberry-pi-os-apt)
  - [fedora, centos, redhat](https://github.com/cli/cli/blob/trunk/docs/install_linux.md#fedora-centos-red-hat-enterprise-linux-dnf)

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
