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
nvm install lts/hydrogen # v18+
nvm install lts/gallium  # v16+
nvm ls
```

```bash
nvm alias default lts/gallium
default -> lts/gallium (-> v16.19.1)
```

```bash
node --version
npm --version
```

## Setup Yarn v3

```bash
corepack enable
yarn --version # 1.22.19

npm config set "strict-ssl" false -g
yarn config set "strict-ssl" false -g
set NODE_TLS_REJECT_UNAUTHORIZED=0
export NODE_TLS_REJECT_UNAUTHORIZED=0
```

---

## Use Yarn v3

in project dir:

```bash
yarn set version stable
yarn --version # 3+
```
