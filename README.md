# NixOS Configuration

This repository contains a NixOS flake configuration for two hosts: a ThinkPad X1 Carbon and a VirtualBox VM.

## Structure

```
├── flake.nix                 # Main flake configuration
├── modules/
│   └── common.nix           # Shared configuration and packages
└── hosts/
    ├── thinkpad/
    │   └── default.nix      # ThinkPad X1 Carbon specific config
    └── virtualbox/
        └── default.nix      # VirtualBox VM specific config
```

## Included Packages

- **Development**: neovim, git, golang
- **Terminal**: ghostty, zellij
- **Kubernetes**: k9s, kubectl, minikube
- **Containers**: podman
- **Desktop**: hyprland, GNOME (fallback)
- **System utilities**: curl, wget, vim, htop, tree, unzip, zip, which

## Installation

### Prerequisites

1. Boot from NixOS installer ISO
2. Partition your disk and mount filesystems
3. Generate hardware configuration: `nixos-generate-config --root /mnt`

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/bxrne/nixos-cfg /mnt/etc/nixos
   cd /mnt/etc/nixos
   ```

2. Update filesystem paths in host configuration to match your setup:
   - Edit `hosts/thinkpad/default.nix` or `hosts/virtualbox/default.nix`
   - Update device paths in `fileSystems` and `swapDevices`

3. Install NixOS:
   ```bash
   # For ThinkPad X1 Carbon
   nixos-install --flake .#thinkpad
   
   # For VirtualBox VM
   nixos-install --flake .#virtualbox
   ```

### Post-Installation

After rebooting into your new system:

```bash
# Rebuild system configuration
sudo nixos-rebuild switch --flake /etc/nixos#thinkpad    # For ThinkPad
sudo nixos-rebuild switch --flake /etc/nixos#virtualbox # For VirtualBox
```

## Configuration Details

### ThinkPad X1 Carbon
- Uses nixos-hardware module for optimal hardware support
- TLP power management enabled
- Bluetooth support
- Intel microcode updates
- UEFI boot with systemd-boot

### VirtualBox VM
- VirtualBox guest additions
- GRUB bootloader
- Optimized display drivers
- Multiple resolution support

### Common Features
- Flakes and nix-command enabled
- Hyprland window manager
- Podman with Docker compatibility
- NetworkManager for networking
- GNOME desktop environment (fallback)
- SSH server with key-based authentication
- Wheel group sudo access without password

## Customization

- Modify `modules/common.nix` to add/remove system-wide packages
- Edit host-specific configurations in `hosts/*/default.nix`
- Add new hosts by creating new directories under `hosts/` and updating `flake.nix`

## Timezone

Currently set to Europe/Dublin. Change in `modules/common.nix` if needed.

## User Account

Default user is named "user". Modify in `modules/common.nix` or override in host-specific configs.
