# <h1 align="center">🏠 Home Manager</h1>

![preview](https://raw.githubusercontent.com/TatuMon/home-manager/refs/heads/main/screen.jpeg "Preview")
![preview2](https://raw.githubusercontent.com/TatuMon/home-manager/refs/heads/main/screen2.jpg "Preview2")

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
manager.

At least Hyprland 0.50 is expected.

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
- [hyprpaper](https://github.com/hyprwm/hyprpaper) - Wallpapers
- [hyprlock](https://github.com/hyprwm/hyprlock) - Lock screen
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) - I prefer to have this system-wide
- [polkit](https://wiki.archlinux.org/title/Polkit) - For priviliged access handling
- [hyprpolkitagent](https://wiki.hypr.land/Hypr-Ecosystem/hyprpolkitagent/) - GUI for polkit

### Keybinds
All Hyprland keybinds are defined in `hyprland/modules/keybindings.conf`

### Wlogout
#### systemd
wlogout options expects systemd to be the init system

#### "Reboot to Windows" option
You might have seen that I added this option to wlogout and is possible that it doesn't work for you.

It's very likely that this is because of how I set up wlogout to call `grub-reboot`. To **fix** this,
you can edit the call in `wlogout/layout` to use the grub menuentry that you set up for Windows.
