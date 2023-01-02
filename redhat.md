# RHEL: Red Hat Enterprise Linux

- download: [Red Hat Enterprise Linux](https://developers.redhat.com/products/rhel/download)

## VirtualBox

### /etc/hosts on Host

```bash
sudo vi /etc/hosts

192.168.8.2 redhat
```

### Host-only network

1. File → Tool → Network Manager
2. Add Host-only Network
   - Name: `RedhatNetwork`
   - Mask: `255.255.255.0`
   - Lower Bound: `192.168.8.1`
   - Upper Bound: `192.168.8.3`
4. Add Network Adapter: Host-only Network
5. IP: `192.168.8.2`

```bash
ssh redhat
ip addr

3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:a8:f4:ee brd ff:ff:ff:ff:ff:ff
    inet 192.168.8.2/24 brd 192.168.8.255 scope global dynamic noprefixroute enp0s8
       valid_lft 86365sec preferred_lft 86365sec
    inet6 fe80::1829:531b:8f5f:58db/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
```

### Install

- name: `redhat8`
- iso: `rhel-8.7-x86_64-dvd.iso`
- unattended install
   - username == Host username
   - hostname: `redhat`
   - domain name: `macintosh.localhost`
- hardware
   - memory: `8192 MB`
   - cpu: `4`
- hard disk: `50 GB` VDI

---

## Start

### sudo

```bash
su
usermod -aG wheel <USER>
```

### Subscription Manager

- article: [How to renew your Red Hat Developer Subscription for Red Hat Enterprise Linux](https://developers.redhat.com/articles/renew-your-red-hat-developer-program-subscription#how_to_re_register_for_your_red_hat_developer_subscription)
- redhat: [https://access.redhat.com/management](https://access.redhat.com/management)

1. **Disabled**: Simple content access for Red Hat Subscription Management
2. Get **Red Hat Developer Subscription for Individuals**

```bash
sudo subscription-manager remove --all
sudo subscription-manager unregister
sudo subscription-manager clean
sudo subscription-manager register
sudo subscription-manager refresh
sudo subscription-manager attach --auto

# sudo subscription-manager list --available
# sudo subscription-manager attach --pool=<POOL-ID>
```

#### locale

```bash
sudo dnf search locale ko
sudo dnf install -y glibc-langpack-ko
```

### EPEL: Extra Packages for Enterprise Linux

- doc: [epel](https://docs.fedoraproject.org/en-US/epel/)

```bash
sudo subscription-manager repos --enable codeready-builder-for-rhel-8-$(arch)-rpms
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo dnf update
```

### Recommended packages

#### zsh

install: [zsh on rhel](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#centosrhel)

```bash
sudo dnf install -y zsh
sudo chsh -s $(which zsh)
chsh -s $(which zsh)
```

#### ohmyzsh

github: [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### development tools

```bash
sudo dnf groupinfo "Development Tools"
sudo dnf group install -y "Development Tools"
```

#### neofetch

```bash
sudo dnf install -y neofetch
```

#### bat

bat: [releases](https://github.com/sharkdp/bat/releases)

```bash
curl -fsSL -O https://github.com/sharkdp/bat/releases/download/v0.22.1/bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
tar xzf bat-v0.22.1-x86_64-unknown-linux-gnu.tar.gz
sudo mv bat-v0.22.1-x86_64-unknown-linux-gnu /opt/bat
rm -rf bat-v0.22.1-x86_64-unknown-linux-gnu

vi ~/.zshrc
alias bat="/opt/bat/bat"
```

#### tree

```bash
sudo dnf install -y tree
```

#### neovim

neovim: [install](https://github.com/neovim/neovim/wiki/Installing-Neovim#centos-8--rhel-8)

```bash
sudo dnf install -y neovim python3-neovim
```

```bash
# vi ~/.zshrc
alias ll='ls -alh'
alias vi=nvim
```
