# AGENTS.md - NixOS Configuration Repository

## Build/Test Commands
- `nix flake check` - Validate flake syntax and evaluate configurations
- `nix build .#nixosConfigurations.virtualbox` - Build VirtualBox configuration
- `nix build .#nixosConfigurations.thinkpad` - Build ThinkPad configuration
- `sudo nixos-rebuild switch --flake .#virtualbox` - Apply VirtualBox config
- `sudo nixos-rebuild switch --flake .#thinkpad` - Apply ThinkPad config
- `sudo nixos-rebuild test --flake .#<hostname>` - Test configuration without making it default
- `nix fmt` - Format Nix files using nixpkgs-fmt
- `home-manager switch --flake .#adambyrne` - Apply home-manager configuration

## Code Style Guidelines
- Use 2-space indentation for Nix files
- Follow nixpkgs naming conventions: camelCase for attributes, kebab-case for packages
- Import modules at the top of files in alphabetical order
- Use `lib.mkDefault` for overridable defaults, `lib.mkForce` for forced values
- Structure flake.nix with clear inputs, outputs sections
- Group related options together with comments explaining purpose
- Use `enable = true;` pattern for optional services
- Prefer declarative over imperative configuration
- Hardware configurations should use placeholder UUIDs (REPLACE-WITH-ACTUAL-UUID)

## File Organization
- `flake.nix` - Main flake definition with Hyprland, home-manager inputs
- `hosts/virtualbox/` - VirtualBox VM configuration
- `hosts/thinkpad/` - ThinkPad X1 Carbon configuration
- `modules/hyprland.nix` - Hyprland desktop environment setup
- `modules/development.nix` - Development tools (git, golang, python, bun, docker)
- `users/adambyrne.nix` - User-specific home-manager configuration

## Development Stack
- Desktop: Hyprland with Waybar, Wofi, Alacritty
- Languages: Go, Python, Node.js, Bun
- Tools: Neovim, Zellij, Git, Docker, Chrome, Obsidian