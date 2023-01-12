# CLI Tools

## tool kit

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

---

## git

```bash
# ubuntu
sudo apt install git
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

## shell

### zsh

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

### noefetch

- [dylanaraps/neofetch](https://github.com/dylanaraps/neofetch)
  - [neofetch/wiki](https://github.com/dylanaraps/neofetch/wiki/)
  - [freebsd](https://github.com/dylanaraps/neofetch/wiki/Installation#freebsd)

```bash
# freebsd
sudo pkg install neofetch
```

---

## terminal

### kitty

- kitty/[install](https://sw.kovidgoyal.net/kitty/binary/)

### warp

- [warp](https://www.warp.dev/) only mac

### fig

- [fig](https://fig.io/)
