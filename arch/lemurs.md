# Lemurs

login manager

- github: [lemurs](https://github.com/coastalwhite/lemurs)

## Install

```bash
sudo pacman -S lemurs
```

```bash
# sudo systemctl disable display-manager.service
sudo systemctl enable lemurs.service
```

## Usage

### After scripts

```bash
cd /etc/lemurs/wayland
```

#### Hyprland

```bash
sudo vim hyprland
```

```bash
#!/bin/sh
exec hyprland
```

```bash
sudo chmod 755 hyprland
```

### Preview

```bash
lemurs --preview
```

## Configuration

```bash
vi /etc/lemurs/config.toml
```

---

## TTY

```bash
Ctrl + Alt + F1 ~ F6
```

```bash
ps -e | grep tty

    562 tty2     00:00:00 lemurs
    584 tty2     00:00:14 hyprland
```

