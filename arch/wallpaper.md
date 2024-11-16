# Wallpaper

- hyprland: [wallpapers](https://wiki.hyprland.org/Useful-Utilities/Wallpapers/)
- [hyprpaper](https://wiki.hyprland.org/Hypr-Ecosystem/hyprpaper/)

## hyprpaper

### Install hyprpaper

```bash
sudo pacman -S hyprpaper
```

### Configuration hyprpaper

```bash
vi ~/.config/hypr/hyprpaper.conf
```

```conf
preload = /home/me/.config/hypr/wallpapers/1.jpg
preload = /home/me/.config/hypr/wallpapers/2.jpg
wallpaper = DP-1, /home/me/.config/hypr/wallpapers/1.jpg
wallpaper = HDMI-A-1, /home/me/.config/hypr/wallpapers/2.jpg
```

#### Monitors

```bash
hyprctl monitors
```

### Autoload hyprpaper

```bash
vi ~/.config/hypr/hyprland.conf
```

```conf
exec-once = hyprpaper
```

