# Emacs

- [GNU Emacs](https://www.gnu.org/s/emacs/)
  - [build](https://github.com/jimeh/emacs-builds) for macos
  - install
    - [linux](https://www.gnu.org/software/emacs/download.html#gnu-linux)
  - [wiki](https://www.emacswiki.org/emacs?interface=en)
  
## Install

### Prerequisites

```bash
# mac
sudo port install ripgrep
sudo port install fd
```

### Install Emacs

default port variants: `+nativecomp` `+rsvg`

```bash
# mac
sudo port install emacs

# ubuntu
sudo apt install emacs
```

### Open in terminal

```bash
emacs ~/.zshrc
```

```bash
alias emacs='emacs -nw' # --no-window-system
```

---

## Init File

```bash
mkdir -p ~/.emacs.d
emacs -nw ~/.emacs.d/init.el
```
