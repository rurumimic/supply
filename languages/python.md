# Python

## Build Tools

- pyenv/wiki/[Suggested build environment](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)

```bash
# mac
sudo port selfupdate
sudo port upgrade outdated
sudo port install openssl readline sqlite3 xz zlib tcl sqlite3-tcl pkgconfig tk +quartz

# ubuntu
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# redhat
sudo dnf install make gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel libuuid-devel gdbm-devel libnsl2-devel
```

## pyenv

- pyenv: [installation](https://github.com/pyenv/pyenv#installation)
- plugins
    - pyenv-virtualenv
    - pyenv-doctor
    - pyenv-update

```bash
curl https://pyenv.run | bash
```

### Download Python

usually:

```bash
pyenv install --list
pyenv install 3.11.5
pyenv install 2.7.18
```

macports user:

```bash
export LDFLAGS="-L/opt/local/lib"
export CPPFLAGS="-I/opt/local/include"
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"

pyenv install 3.11.5
```

#### Pyenv Init

```bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
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

VERSION=3.11.5
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

```bash
pyenv global 3.11.5
pip install --upgrade pip setuptools wheel
```

### for neovim virtualenv

```bash
pyenv virtualenv 3.11.5 vim
pyenv activate vim

pyenv which python # ~/.pyenv/versions/vim/bin/python

pip install --upgrade pip setuptools wheel 
pip install pynvim

pyenv deactivate
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

