# <h1 align="center">🏠 Home Manager</h1>

![preview](https://raw.githubusercontent.com/TatuMon/home-manager/refs/heads/main/home-manager.jpeg "Preview")

# Requirements
- [Nix (the package manager)](https://nixos.org/learn/)
- [NixGL (only for standalone home-manager)](https://github.com/nix-community/nixGL?tab=readme-ov-file#installation)

# Installation
> To install home-manager, please refer to the [manual page](https://nix-community.github.io/home-manager/index.xhtml#ch-installation)

I personally use the standalone `home-manager` tool, but this configuration
should also work for the `home-manager` NixOS module. I didn't test it.

# Notes
### Hyprland
This repo only contains the hyprland and waybar configuration files.
To install the binaries, you have to do it yourself with your system's package
manager

As I stated above, I'm using the standalone version, so I decided to install
Hyprland system-wide and manage it using my distro's systemd.

### Why NixGL
NixGL solves the issue where packages installed using Nix can't access
OpenGL drivers.

This doesn't happen in NixOS.

### Extra software
Like what happens with Hyprland, some software needs access to system files,
so installing them with home-manager is not possible.

Here is the list of the packages that you need to install by yourself:
- [swaync](https://github.com/ErikReider/SwayNotificationCenter) (notifications)
- [hyprpaper](https://github.com/hyprwm/hyprpaper) (wallpapers)
- [hyprlock](https://github.com/hyprwm/hyprlock) (lock screen)
- [pcloud](https://www.pcloud.com) (this is the cloud service I use. it's not necessary)
- [discord](https://discord.com) (I prefer to install this manually, so I can get the last update)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) (I prefer to have this system-wide)
- [openssh](https://wiki.archlinux.org/title/OpenSSH) (Needed for sshy)
