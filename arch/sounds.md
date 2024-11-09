# Sound system

- wiki
  - [sound system](https://wiki.archlinux.org/title/Sound_system)
  - [ALSA](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture)
  - [PipeWire](https://wiki.archlinux.org/title/PipeWire)
- github
  - [easyeffects](https://github.com/wwmm/easyeffects)

## Install

```bash
sudo pacman -S pipewire pipewire-alsa
sudo pacman -S easyeffects
```

### Hyprland

```conf
exec-once = easyeffects --gapplication-service
```

