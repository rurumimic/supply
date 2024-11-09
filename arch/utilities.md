# Utilities

- hyprland: [utilities](https://wiki.hyprland.org/Useful-Utilities/)

## Notification

### dunst

Install:

```bash
sudo pacman -S dunst
```

hyprland.conf:

```bash
exec-once = dunst
```

conf:

```bash
mkdir -p ~/.config/dunst
cp /etc/dunst/dunstc ~/.config/dunst/dunstc
```

edit:

```rc
[global]
  monitor = 1
```

test:

```bash
notify-send 'Hello' 'Hello, World!'
```

## Status bar

### waybar

```bash
sudo pacman -S waybar
```

hyprland.conf:

```bash
exec-once = waybar
```

conf:

```bash
mkdir -p ~/.config/waybar
cp "/etc/xdg/waybar/*" ~/.config/waybar
```

## App Launcher

### Rofi

```bash
sudo pacman -S rofi-wayland
```

hyprland.conf:

```bash
$menu = rofi -show combi -combi-modes "window,run,ssh" -modes combi
```

Key: `Super` + `R`


## Clipboard managers

### clipboard

```bash
yay -S clipbaord
```

```conf
exec-once = cb
```

## File Managers

### nautilus

```bash
sudo pacman -S nautilus nautilus-image-converter
yay -S nautilus-open-any-terminal 
```

hyprland.conf:

```bash
$fileManager = nautilus
```


