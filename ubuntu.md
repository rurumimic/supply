# Ubuntu

## Terminal

### zsh

```bash
sudo apt install zsh
```

```bash
autoload -Uz zsh-newuser-install
zsh-newuser-install -f
```

```bash
chsh -s /usr/bin/zsh
```

### Build Essential

```bash
sudo apt update
sudo apt install build-essential
```

### Git

```bash
sudo apt install git
```

```bash
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor vi
git config --list
```

### GitHub CLI

- [github cli](https://cli.github.com/)
- [Installing gh on Linux and BSD](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

```bash
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

```bash
sudo apt update
sudo apt install gh
```

### Bat

```bash
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

### Tree

```bash
sudo apt install tree
```

### fzf

```bash
sudo apt install fzf
```

### fd

fd: [installation](https://github.com/sharkdp/fd#installation)

```bash
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```

### ripgrep

ripgrep: [install](https://github.com/BurntSushi/ripgrep#installation)

```bash
sudo apt install ripgrep
```

### cscope

```bash
sudo apt install cscope
```

### global

```bash
sudo apt install global
```

