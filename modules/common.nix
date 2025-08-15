{ config, pkgs, ... }:

{
  system.stateVersion = "24.05";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    settings.trusted-users = [ "root" "@wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Dublin";

  environment.systemPackages = with pkgs; [
    neovim
    ghostty
    go
    git
    hyprland
    k9s
    kubectl
    minikube
    podman
    zellij
    
    curl
    wget
    vim
    htop
    tree
    unzip
    zip
    which
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  users.users.bxrne = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.bash;
    initialPassword = "helloworld123";
  };

  security.sudo.wheelNeedsPassword = false;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
  ];
}