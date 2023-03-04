# Supply

<div style="margin: auto; font-family: serif;">
    <p>전차가 1천 대, 보급 차량이 1천 량, 무장병 10만에, 양식은 1천 리를 보내야 하며, 전쟁에 관련된 국내의 비용과 전지의 비용, 접대비, 병기 수리용 자재, 군수품 조달 등 날마다 1천 금의 거액을 소비하여야 한다.<br>그런 다음에라야 10만의 군사를 출동시킬 수가 있다.</p>
  <footer align="left"><i>손자병법, 작전편</i></footer>
</div>

---

## Operating system

- [mac](mac.md)
- linux
  - [ubuntu](ubuntu.md)
  - [redhat](redhat.md): [podman](docs/podman.md)
  - [arch](arch.md)
- [freebsd](freebsd.md)
- [windows](windows.md)

## CLI tools

- [shell](tools.md#shell)
  - [zsh](tools.md#zsh): shell designed for interactive use
  - [ohmyzsh](tools.md#ohmyzsh): delightful community-driven framework for managing your zsh configuration
    - [.zshrc](config/zshrc.sh)
  - [neofetch](tools.md#noefetch): command-line system information tool
  - [highlight](tools.md#highlight): syntax highlighting
- [packages](tools.md#packages)
  - [developer tool kit](tools.md#developer-tool-kit)
  - [bat](tools.md#bat): cat(1) clone with wings
  - [tree](tools.md#tree): recursive directory listing command
  - [fzf](tools.md#fzf): command-line fuzzy finder
  - [fd](tools.md#fd): simple, fast and user-friendly alternative to 'find'
  - [delta](tools.md#delta): syntax-highlighting pager for git, diff, and grep output
  - [clang](tools.md#clang): c language family frontend for llvm 
  - [cmake](tools.md#cmake): build, test and package
  - [ninja](tools.md#ninja): small build system
  - [gnu global](tools.md#gnu-global): source code tag system
  - [cscope](tools.md#cscope): developer's tool for browsing source code
  - [universal ctags](tools.md#universal-ctags): maintained ctags implementation
  - [astyle](tools.md#astyle): source code indenter, formatter, and beautifier for the C, C++, C++/CLI, Objective‑C, C# and Java programming languages
- [git](tools.md#git)
  - [github cli](tools.md#github-cli)
- [terminal](tools.md#terminal)
  - [kitty](tools.md#kitty): fast, feature-rich, GPU based terminal emulator
  - [warp](tools.md#warp): blazingly fast, rust-based terminal
  - [fig](tools.md#fig): command line tool

## Editor

- [vim](vim.md)
  - neovim
  - spacevim: [init.toml](config/vim/init.toml), [init.vim](config/vim/init.vim)
- [emacs](emacs.md)
  - doom emacs
- [code](code.md)
  - extensions
  - themes

## Languages

- [Python](languages/python.md)
  - pyenv & virtualenv
  - autoenv
  - poetry
- [Node](languages/node.md)
  - nvm
  - node
  - yarn v3
- Rust
  - rustup: [install.md](https://github.com/rurumimic/rust#install-by-rustup)
- Go
  - gvm: [install.md](https://github.com/rurumimic/golang/blob/main/install.md)
  - go
  - protobuf3
  - spacevim [Go IDE](https://spacevim.org/use-vim-as-a-go-ide/)
- [Java](languages/java.md)
  - [jenv](https://github.com/jenv/jenv)

## Virtualization

- Linux Container
  - docker.com/[docker desktop](https://www.docker.com/products/docker-desktop/)
  - [podman](redhat.md#podman) on RedHat
    - mac ↔ redhat
    - Run podman in container
- VirtualBox: [download](https://www.virtualbox.org/wiki/Downloads)
- Vagrant: [Download](https://www.vagrantup.com/downloads)

### VirtualBox

```bash
mkdir -p ~/vm/virtualbox
```

1. Preferences
2. Default machine folder: `~/vm/virtualbox`

---

## Code hierarchy

```bash
~/
├── code/
│   ├── github/
│   │   ├── <my-repos>
│   │   └── <organiation-repos>
│   ├── opensources/
│   └── workspace/       # sandbox: vagrant
└── vm/
    └── virtualbox/      # virtual box files: .vbox, .vmdk
```

