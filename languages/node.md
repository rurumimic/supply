# Node

- [nvm-sh/nvm](https://github.com/nvm-sh/nvm)

## Install NVM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# ~/.zshrc
source /opt/local/share/nvm/init-nvm.sh

nvm --help
```

## Install Node

```bash
nvm install --lts
nvm install 18
nvm install 16
```

```bash
nvm alias default lts/*
```

```bash
node --version
npm --version
```

## Setup Yarn.js

```bash
corepack enable
yarn --version # 1.22.19
```

## (option) Set Certs

```bash
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt
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

