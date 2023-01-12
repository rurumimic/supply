# Ubuntu

## Terminal

### xclip

[xclip](https://github.com/astrand/xclip)

```bash
sudo apt install xclip
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

```lua
set clipboard+=unnameplus
```

### delta

- doc: [install](https://dandavison.github.io/delta/installation.html)
- [releases](https://github.com/dandavison/delta/releases)

```bash
dpkg -i git-delta_0.15.1_amd64.deb 
```

```bash
vi ~/.gitconfig
```

---

## Terminal

### kitty

[install](https://sw.kovidgoyal.net/kitty/binary/)

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

config: `ctrl+shift+f2`

```bash
font_family Hack

map alt+c copy_to_clipboard
map alt+v paste_from _clipboard
```

### highlight

[andre-simon.de](http://www.andre-simon.de/index.php)

```bash
sudo apt install highlight
```
