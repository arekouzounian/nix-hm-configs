# Nix Home Manager Configurations

Personal [Home Manager](https://github.com/nix-community/home-manager) configurations for managing my dotfiles and development environment using Nix flakes.

## Overview

This is my main home manager config on NixOS. Main configs:
- **Sway** - Wayland compositor with custom keybindings and workspace setup
- **Shell** - Bash with custom functions, aliases, and Starship prompt
- **Status bar** - Waybar with system monitoring widgets
- **Application launcher** - Wofi with custom styling
- **Screen locking** - Swaylock with custom configuration

I also use Vim, but configure that separately. I tried NixVim but it's just too much machinery and poor DX.

I don't recommend you try to recreate this setup because it's not optimized for public consumption or anything like that. But if you want an AI-generated description on how to install, see below.


## Prerequisites
- [Nix](https://nixos.org/download.html) with flakes enabled
- Git

### Enable Nix Flakes

Add to your `~/.config/nix/nix.conf` or `/etc/nix/nix.conf`:

```
experimental-features = nix-command flakes
```

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/arekouzounian/nix-hm-configs.git ~/.config/home-manager
   cd ~/.config/home-manager
   ```

2. **Update configuration:**

   Edit `config.nix` to customize your settings:
   - Username and home directory
   - Display outputs (monitor names for Sway)
   - Wallpaper and screenshot paths
   - Sway modifier key and resize amount

   The configuration is centralized in `config.nix` for easy customization.

3. **Build and activate:**

   ```bash
   nix run home-manager/master -- switch --flake .#arek
   ```

   Or if you have home-manager installed:

   ```bash
   home-manager switch --flake .#arek
   ```

## Usage

### Updating

To update your configuration after making changes:

```bash
home-manager switch --flake ~/.config/home-manager#arek
```

### Updating Dependencies

Update flake inputs (nixpkgs, home-manager, nixvim):

```bash
nix flake update
```

Then rebuild:

```bash
home-manager switch --flake ~/.config/home-manager#arek
```

### Custom Aliases

The configuration includes several useful bash aliases:

- `bhome` - Rebuild and switch home-manager configuration
- `gst` - Git status
- `gcm` - Git commit with message
- `gd` - Git diff
- `ll` - Detailed directory listing

### Custom Functions

- `duck [dir]` - Show total size of a directory
- `quack` - Show sizes of all subdirectories in current directory
- `cd` - Enhanced to auto-list files after changing directories

## Customization

### Adding New Modules

1. Create a new directory under `modules/`
2. Add a `default.nix` file
3. Import it in `modules/default.nix` or `home.nix`

### Configuring Neovim

Neovim is configured using nixvim. To add plugins or change settings:

- Edit `modules/neovim/options.nix` for editor options
- Add plugin configs in `modules/neovim/plugins/`
- Edit `modules/neovim/plugins/lsp.nix` to add language servers

### Window Manager (Sway)
Sway configuration is in `home.nix` under `wayland.windowManager.sway`. Key features:

- Mod key: `Alt` (Mod1)
- Terminal: Kitty
- App launcher: Wofi (Mod+Space)
- Screenshots: Mod+Shift+S


## Contributing
This is a personal configuration repository. If you want to suggest something, why? But also, sure. Send in a pull request, I would actually be very excited.

## Resources
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html)
- [nixvim Documentation](https://nix-community.github.io/nixvim/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
