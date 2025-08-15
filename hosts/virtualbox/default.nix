{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/virtualisation/virtualbox-guest.nix")
  ];

  boot = {
    initrd = {
      availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ ];
    extraModulePackages = [ ];
    
    loader = {
      grub = {
        enable = true;
        device = "/dev/sda";
      };
    };
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/disk/by-label/swap"; }
  ];

  networking = {
    hostName = "weaponvm";
    useDHCP = lib.mkDefault true;
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  virtualisation.virtualbox.guest = {
    enable = true;
    x11 = true;
  };

  services.xserver = {
    videoDrivers = [ "virtualbox" "vmware" "cirrus" "vesa" "modesetting" ];
    resolutions = [
      { x = 1920; y = 1080; }
      { x = 1680; y = 1050; }
      { x = 1280; y = 1024; }
    ];
  };

  environment.systemPackages = with pkgs; [
    virtualbox-guest-additions
  ];
}
