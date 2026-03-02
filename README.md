# Supply

## Operating system

- [mac](mac.md)
- linux
  - [ubuntu](ubuntu/README.md): [vagrant](ubuntu/vagrant/Vagrantfile), [ansible/playbook.yaml](ubuntu/vagrant/ansible/playbook.yaml)
  - [redhat](redhat.md): [podman](docs/podman.md)
  - [fedora](fedora/README.md): [vagrant](fedora/vagrant/Vagrantfile)
  - [arch](arch.md)
- [freebsd](freebsd/README.md): [vagrant](freebsd/vagrant/Vagrantfile)
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
  - [git](tools.md#git): distributed version control system
  - [bat](tools.md#bat): cat(1) clone with wings
  - [tree](tools.md#tree): recursive directory listing command
  - [fzf](tools.md#fzf): command-line fuzzy finder
  - [fd](tools.md#fd): simple, fast and user-friendly alternative to 'find'
  - [clang](tools.md#clang): c language family frontend for llvm
  - [cmake](tools.md#cmake): build, test and package
  - [ninja](tools.md#ninja): small build system
  - [gnu global](tools.md#gnu-global): source code tag system
  - [cscope](tools.md#cscope): developer's tool for browsing source code
  - [universal ctags](tools.md#universal-ctags): maintained ctags implementation
  - [astyle](tools.md#astyle): source code indenter, formatter, and beautifier for the C, C++, C++/CLI, Objective‑C, C# and Java programming languages
  - [gdb](tools.md#gdb): GNU Project debugger
  - [bear](tools.md#bear): a tool that generates a compilation database for clang tooling
- [git](tools.md#git)
  - [github cli](tools.md#github-cli)
  - [lazygit](tools.md#lazygit)
- [terminal](tools.md#terminal)
  - [wezterm](tools.md#wezterm)
  - [ghostty](tools.md#ghostty)
  - [kitty](tools.md#kitty): fast, feature-rich, GPU based terminal emulator
  - [warp](tools.md#warp): blazingly fast, rust-based terminal
  - [fig](tools.md#fig): command line tool
  - [alacritty](tools.md#alacritty): OpenGL terminal emulator
  - [tmux](tools.md#tmux): a terminal multiplexer

## Editor

- sudo: `sudo -E vi file`
- [vim](vim/README.md)
  - [neovim](vim/neovim.md)
    - my [.config/nvim/lua/custom](https://github.com/rurumimic/nvim)
    - package manager
    - plugins
- [emacs](emacs/README.md)
  - [doom emacs](emacs/doomemacs.md)
- [code](code.md)
  - extensions
  - themes

### Fonts

- [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack)
- [Hasklig](https://github.com/i-tu/Hasklig): `editor.fontWeight: 500`
- [MesloLGS NF](https://github.com/romkatv/powerlevel10k#manual-font-installation)
- [Cartograph CF](https://connary.com/cartograph.html): $50

## Languages

- [Python](languages/python.md)
  - pyenv & virtualenv
  - autoenv
  - poetry
- [Node](languages/node.md)
  - nvm
  - node
  - yarn
- Rust
  - rustup: [install.md](https://github.com/rurumimic/rust#install-by-rustup)
- Go
  - gvm: [install.md](https://github.com/rurumimic/golang/blob/main/install.md)
  - go
- [Java](languages/java.md)
  - jenv
- [C#](languages/csharp.md)

## Virtualization

- Linux Container
  - docker.com/[docker desktop](https://www.docker.com/products/docker-desktop/)
  - [podman](redhat.md#podman) on RedHat
    - mac ↔ redhat
    - Run podman in container
  - [minikube](docs/minikube.md): kvm2, qemu
- VirtualBox: [download](https://www.virtualbox.org/wiki/Downloads)
  - [ubuntu](ubuntu/virtualbox.md)
- Vagrant: [Download](https://www.vagrantup.com/downloads)
  - [ubuntu](ubuntu/vagrant.md)

### VirtualBox

```bash
mkdir -p ~/vm/virtualbox
```

1. Preferences
2. Default machine folder: `~/vm/virtualbox`

---

## Refs

### Templates

- [.gitignore](https://www.toptal.com/developers/gitignore?templates=vim,emacs,linux,macos,windows,visualstudiocode,tags): macos,windows,linux,vim,emacs,visualstudiocode,tags
- [readme](https://readme.so/editor)

