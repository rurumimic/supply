# Hyprland

- hyprland [wiki](https://wiki.hyprland.org/)
- arch wiki: [Hyprland](https://wiki.archlinux.org/title/Hyprland)

## Install

```bash
sudo pacman -S hyprland
```

### terminal

#### yay

```bash
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

#### wezterm

```bash
yay -S wezterm-git
```

### Configuration

```bash
mkdir -p ~/.config/hypr
```

```bash
curl -o ~/.config/hypr/hyprland.conf \
https://raw.githubusercontent.com/hyprwm/Hyprland/refs/heads/main/example/hyprland.conf
```

```bash
vim ~/.config/hypr/hyprland.conf
```

```bash
$terminal = wezterm

env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia

cursor {
    no_hardware_cursors = true
}
```

## Run Hyprland

```bash
hyprland
```

## Troubleshooting

### When keys are not working

to switch to tty3

```bash
Ctrl + Alt + F3
```

