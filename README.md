# Start

Start my macbook

## Follow these steps

1. Computer Name
2. Finder
   - Preferneces: Side Menu
4. Keyboard
   - Function keys
   - Caps Lock → Control
   - Turn off auto
   - Shortcuts
5. Terminal
   - Command Line Tools
   - Warp Terminal
   - MacPorts
   - Neovim
   - SpaceVim
   - GitHub CLI
   - Bat
6. Languages
   - Go

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
   - Check: Show all filename extensions

---

### Keyboard

**System Preferences** -> **Keyboard**

#### (option) Function Keys

To use Text Editor(SpaceVim) conveniently

1. `Keyboard` Tab
2. Check: Use F1, F2, etc. keys as standard function keys

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

## Terminal

### Command Line Tools

```bash
echo $SHELL # /bin/zsh
xcode-select --install
```

### Warp Terminal

Install [warp](https://www.warp.dev)

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

Alias `~/.zprofile`:

```bash
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

#### Setting

Open: `vi ~/.SpaceVim.d/init.toml`

Add layers:

```toml
[[layers]]
    name = 'git'

[[layers]]
    name = 'VersionControl'
```

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

---

## My Codes

```bash
mkdir -p ~/Code/github/rurumimic
```

---

## Languages

- Go
   - [rurumimic/golang/install.md](https://github.com/rurumimic/golang/blob/main/install.md)
