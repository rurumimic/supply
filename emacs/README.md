# Emacs

- [GNU Emacs](https://www.gnu.org/s/emacs/)
  - [build](https://github.com/jimeh/emacs-builds)
  - install
    - [linux](https://www.gnu.org/software/emacs/download.html#gnu-linux)
- [Doom Emacs](https://github.com/doomemacs/doomemacs)

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
sudo port install emacs
```

### Doom Emacs

```bash
# rm -rf ~/.emacs.d
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

```bash
# ~/.zshrc
export PATH="$HOME/.emacs.d/bin:$PATH"
```

```bash
doom doctor
```

#### Help

```bash
emacs ~/.doom.d/init.el
emacs ~/.doom.d/packages.el

doom sync
```

```bash
doom doctor
```

```bash
doom upgrade
```

Doom Documentation:

- `SPC h d h`
- `C-h d h`
- `M-x doom/help`

#### macOS bug

```bash
# ~/.doom.d/init.el
(when (eq system-type 'darwin) (customize-set-variable 'native-comp-driver-options '("-Wl,-w")))
```
