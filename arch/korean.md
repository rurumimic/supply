# Korean

- wiki: [localization/korean](https://wiki.archlinux.org/title/Localization_(%ED%95%9C%EA%B5%AD%EC%96%B4)/Korean_(%ED%95%9C%EA%B5%AD%EC%96%B4))

## fcitx5

```bash
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-hangul
```

### Settings

```bash
fcitx5-configtool
```

### Input Method

- Group: Default
  - Hangul
  - Keyboard - English (US)
- Global Options
  - Trigger Input Method: Hangul, Alt+Space
  - Share Input State: disable Show Input Method Information when switch input method

### Hyprland

```bash
vim ~/.config/hypr/hyprland.conf
```

```conf
env = XDG_CURRENT_DESKTOP,Hyprland
env = GTK_IM_MODULE,fcitx
env = QT_IM_MODULE,fcitx
env = SDL_IM_MODULE,fcitx
env = GLFW_IM_MODULE,fcitx
env = XMODIFIERS,@im=fcitx
exec-once = fcitx5 -d
```

