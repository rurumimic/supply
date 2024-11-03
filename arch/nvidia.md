# NVIDIA on Arch

- wiki: [nvidia](https://wiki.archlinux.org/title/NVIDIA)
- nouveau CodeNames
  - [nv170](https://nouveau.freedesktop.org/CodeNames.html#NV170)

```bash
lspci -k | grep -A 2 -E "(VGA|3D)"
```

## Installation

```bash
pacman -Syu nvidia
```

### DRM Kernel Module

Add NVIDIA driver modules to the initramfs.

```bash
sudo vim /etc/mkinitcpio.conf
```

```bash
MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

```bash
sudo mkinitcpio -P
```

