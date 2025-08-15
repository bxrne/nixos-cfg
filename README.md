# NixOS Configuration

My NixOS configuration flake for developer environment with Hyprland desktop.

## Hosts

- **virtualbox** - Oracle VirtualBox VM configuration
- **thinkpad** - Thinkpad X1 Carbon laptop configuration

## Tools & Environment

### Desktop Environment
- **Hyprland** - Wayland compositor
- **Waybar** - Status bar
- **Wofi** - Application launcher
- **Alacritty** - Terminal emulator
- **Dunst** - Notifications

### Development Tools
- **git** - Version control
- **golang** - Go programming language
- **python3** - Python programming language  
- **bun** - JavaScript runtime and package manager
- **neovim** - Text editor
- **zellij** - Terminal multiplexer
- **docker** - Containerization

### Applications
- **Google Chrome** - Web browser
- **Obsidian** - Note-taking
- **Discord** - Communication
- **VLC** - Media player

## Quick Start

1. Clone this repository
2. Update hardware configuration for your system:
   ```bash
   sudo nixos-generate-config --show-hardware-config > hosts/<hostname>/hardware-configuration.nix
   ```
3. Build and apply configuration:
   ```bash
   sudo nixos-rebuild switch --flake .#<hostname>
   ```

## Structure

```
├── flake.nix                 # Main flake configuration
├── hosts/
│   ├── virtualbox/          # VirtualBox VM config
│   └── thinkpad/            # ThinkPad laptop config
├── modules/
│   ├── hyprland.nix         # Desktop environment
│   └── development.nix      # Development tools
└── users/
    └── adambyrne.nix        # User-specific configuration
```