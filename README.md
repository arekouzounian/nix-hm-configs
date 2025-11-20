# Nix Home Manager Configurations

Personal [Home Manager](https://github.com/nix-community/home-manager) configurations for managing my dotfiles and development environment using Nix flakes.

## Overview

This repository contains my declarative system configuration managed with Nix Home Manager. It includes configurations for:

- **Neovim** - Configured using [nixvim](https://github.com/nix-community/nixvim) with LSP, treesitter, and completion
- **Sway** - Wayland compositor with custom keybindings and workspace setup
- **Shell** - Bash with custom functions, aliases, and Starship prompt
- **Terminal** - Alacritty with custom theming and keybindings
- **Status bar** - Waybar with system monitoring widgets
- **Application launcher** - Wofi with custom styling
- **Screen locking** - Swaylock with custom configuration

## Structure

```
.
├── flake.nix              # Flake definition with inputs and outputs
├── config.nix             # User-specific configuration (customize this!)
├── home.nix               # Main home configuration (user settings, packages, GTK)
└── modules/
    ├── default.nix        # Module entry point (imports all modules)
    ├── shell.nix          # Bash and Starship prompt configuration
    ├── alacritty.nix      # Alacritty terminal emulator configuration
    ├── wayland.nix        # Sway, Waybar, Wofi, and Swaylock configuration
    └── neovim/            # Neovim configuration
        ├── default.nix    # Neovim setup
        ├── options.nix    # Editor options and settings
        └── plugins/       # Plugin configurations
            ├── default.nix    # Auto-imports all plugins
            ├── cmp.nix        # Completion plugin
            ├── lsp.nix        # Language server setup
            ├── lualine.nix    # Status line
            └── treesitter.nix # Syntax highlighting
```

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
- Terminal: Alacritty
- App launcher: Wofi (Mod+Space)
- Screenshots: Mod+Shift+S

## Key Bindings

### Sway

- `Mod+Enter` - Open terminal
- `Mod+Space` - Application launcher
- `Mod+Shift+Q` - Close window
- `Mod+Shift+S` - Take screenshot
- `Mod+R` - Resize mode

### Alacritty

- `Ctrl+N` - New window
- `Ctrl+Enter` - Toggle fullscreen
- `Ctrl+Q` - Quit

## Troubleshooting

### Nix command not found

Make sure Nix is installed and in your PATH:

```bash
. ~/.nix-profile/etc/profile.d/nix.sh
```

### Flakes not enabled

Enable experimental features as described in Prerequisites.

### Build errors

Try updating flake inputs:

```bash
nix flake update
```

## Contributing

This is a personal configuration repository, but suggestions and improvements are welcome! Feel free to:

- Open an issue for bugs or suggestions
- Submit a pull request with improvements
- Use this as a template for your own configurations

## License

MIT License - feel free to use and modify for your own configurations.

## Acknowledgments

- [Nix](https://nixos.org/) - The package manager and build system
- [Home Manager](https://github.com/nix-community/home-manager) - Dotfile management
- [nixvim](https://github.com/nix-community/nixvim) - Neovim configuration in Nix
- [LudovicDeMatteis](https://github.com/LudovicDeMatteis/.dotfiles) - Neovim module structure inspiration

## Resources

- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html)
- [nixvim Documentation](https://nix-community.github.io/nixvim/)
- [Nix Flakes](https://nixos.wiki/wiki/Flakes)
