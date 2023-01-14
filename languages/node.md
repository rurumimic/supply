# Node

- [nvm-sh/nvm](https://github.com/nvm-sh/nvm)
- spacevim [JS IDE](https://spacevim.org/use-vim-as-a-javascript-ide/)

## Install NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# ~/.zshrc
source /opt/local/share/nvm/init-nvm.sh

nvm --help
```

## Install Node

```bash
nvm install --lts # v18+
nvm ls
node --version
npm --version
```

## Setup Yarn v3

```bash
corepack enable
yarn --version # 1.22.19
```

---

## Use Yarn v3

in project dir:

```bash
yarn set version stable
yarn --version # 3+
```
