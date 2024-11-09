# Arch Mirror List

- arch
  - wiki: [mirrors](https://wiki.archlinux.org/title/Mirrors)
  - mirrorlist
    - [kr, ipv6, activate](https://archlinux.org/mirrorlist/?country=KR&ip_version=6&use_mirror_status=on)

Edit:

```bash
sudo vim /etc/pacman.d/mirrorlist
```

Refresh:

```bash
sudo pacman -Syyyu
```

