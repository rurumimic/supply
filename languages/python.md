# Python

## dependencies

- pyenv/wiki/[Suggested build environment](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

```bash
# mac
sudo port selfupdate
sudo port upgrade outdated
sudo port install openssl readline sqlite3 xz zlib tcl sqlite3-tcl


# ubuntu
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# redhat
sudo dnf install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel
```

## pyenv

- pyenv: [installation](https://github.com/pyenv/pyenv#installation)
- pyenv-virtualenv: [installation](https://github.com/pyenv/pyenv-virtualenv#installation)

```bash
# linux
curl https://pyenv.run | zsh

# macos, freebsd
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
cd ~/.pyenv && src/configure && make -C src
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

### pyenv-virtualenv

```bash
# macos, freebsd
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
```

### Download Python

```bash
pyenv install --list
pyenv install 3.11.4
pyenv install 2.7.18
```

```bash
# curl-config --ca
port info zlib
port contents zlib
export LDFLAGS="-L/opt/local/lib"
export CPPFLAGS="-I/opt/local/include"

pyenv install 3.11.4
```

#### Offline Install

Check available Python versions:

```bash
pyenv install --list
```

If you don't have the version you want, update pyenv.

Download Python `.tar.xz` archive and save:

```bash
mkdir -p ~/.pyenv/sources
cd ~/.pyenv/sources

VERSION=3.11.4
curl -O https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tar.xz
```

Install Python:

```bash
pyenv install -k -v $VERSION
```

#### (optional) Clang on mac

- pyenv issue
  - apple clang: [comment](https://github.com/pyenv/pyenv/issues/2143#issuecomment-1072032647)
  - [bugs](https://bugs.python.org/issue45405)

```bash
sudo port install clang-12
port select --list clang
port select --set clang mp-clang-12
```

Install old python:

```bash
CC=/opt/local/bin/clang pyenv install 3.7.0
```

### Global Python

- [black](https://github.com/psf/black)

```bash
pyenv global system 3.11.4
pip install --upgrade pip setuptools wheel
pip install black
```

### for neovim virtualenv

#### vim3

```bash
pyenv virtualenv 3.11.4 vim3
pyenv activate vim3

pyenv which python # ~/.pyenv/versions/vim3/bin/python

pip install --upgrade pip setuptools wheel 
pip install pynvim

pyenv deactivate
```

#### vim2

```bash
pyenv virtualenv 2.7.18 vim2
pyenv activate vim2

pyenv which python # ~/.pyenv/versions/vim2/bin/python

pip install pynvim

pyenv deactivate
```

### SpaceVim with Python

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
  - INFO: Python version: 3.11.4
  - INFO: pynvim version: 0.4.3
  - OK: Latest pynvim is installed.
```

## autoenv

- [autoenv](https://github.com/hyperupcall/autoenv)

```bash
git clone https://github.com/hyperupcall/autoenv ~/.autoenv
```

```bash
# ~/.zshrc
export AUTOENV_ENV_FILENAME='.autoenv'
export AUTOENV_ENV_LEAVE_FILENAME='.autoenv.leave'
export AUTOENV_ENABLE_LEAVE='enabled'
source ~/.autoenv/activate.sh
```

## poetry

- [poetry](https://python-poetry.org/)
  - [docs](https://python-poetry.org/docs/)

```bash
curl -sSL https://install.python-poetry.org | python3 -
poetry self update
```

```bash
# ohmyzsh
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

```bash
# ~/.zshrc
plugins(
  poetry
  ...
)

export PATH="$HOME/.local/bin:$PATH"
```
