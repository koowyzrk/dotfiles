# Dotfiles

This repository contains my personal dotfiles for a Hyprland-based desktop setup and a customized Zsh and Neovim environment.

## What's included

- `~/.zshrc` for Zsh, Oh My Zsh, `zoxide`, `fzf`, `eza`, NVM, and a few custom aliases
- `~/.config/hypr` for Hyprland, Hyprpaper, and Hyprlock
- `~/.config/kitty` for Kitty terminal settings
- `~/.config/waybar` for the status bar
- `~/.config/rofi` for the application launcher
- `~/.config/wlogout` for logout and power actions
- `~/.config/nvim` for my Neovim setup

## Recommended packages

The exact package names depend on your distribution, but these are the main tools used by the configuration:

### Core desktop

- Hyprland
- Hyprpaper
- Hyprlock
- Waybar
- Rofi
- Wlogout
- Kitty

### Shell and terminal tools

- Zsh
- Oh My Zsh
- zoxide
- fzf
- eza
- ranger
- git
- curl
- ripgrep

### Neovim dependencies

- Neovim
- git
- gcc or clang
- cmake
- make
- nodejs
- npm
- python
- pipx

### Extra utilities used by the config

- brightnessctl
- pavucontrol
- swaync
- blueman
- network-manager-applet
- nvm
- openvpn
- MangoHud
- Google Cloud SDK
- Java JDK
- Rust and cargo
- .NET SDK
- Godot

### Optional but useful

- papirus-icon-theme
- gtk themes and cursor themes that match your desktop
- NVIDIA drivers if you use the same Hyprland environment variables as this setup

## Notes

- The Hyprland config expects `kitty`, `rofi`, `waybar`, `hyprpaper`, `swaync`, and `hpr-scratcher` to be available in `PATH`.
- The Zsh setup sources NVM from `/usr/share/nvm/init-nvm.sh`, so adjust that path if your distribution stores it elsewhere.
- Some paths and aliases are personal, for example the `alt` alias and the Java path in `.zshrc`.

## Usage

Clone this repository and symlink or copy the files you want into your home directory.
If you use a dotfile manager, point it at the files in this repo and apply the links from there.

