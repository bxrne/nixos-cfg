{ config, pkgs, inputs, ... }:

{
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # XDG portal for screen sharing
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Enable display manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # System packages for Hyprland
  environment.systemPackages = with pkgs; [
    # Terminal and file manager
    alacritty
    waybar
    wofi
    dunst
    
    # Screenshot and screen recording
    grim
    slurp
    wl-clipboard
    
    # File manager
    nautilus
    
    # Browser
    google-chrome
    
    # Obsidian
    obsidian
    
    # Audio control
    pavucontrol
    
    # Network manager
    networkmanagerapplet
    
    # Bluetooth
    blueman
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # Graphics drivers
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}