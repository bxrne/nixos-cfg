{ config, pkgs, ... }:

{
  # Development tools
  environment.systemPackages = with pkgs; [
    # Version control
    git
    git-lfs
    
    # Programming languages
    go
    python3
    python3Packages.pip
    python3Packages.pipx
    nodejs
    bun
    
    # Development tools
    neovim
    zellij
    tmux
    
    # Build tools
    cmake
    gnumake
    gcc
    
    # Database tools
    sqlite
    
    # Docker
    docker
    docker-compose
    
    # Other useful dev tools
    jq
    yq
    ripgrep
    fd
    bat
    eza
    tree
    htop
    btop
  ];

  # Enable Docker
  virtualisation.docker.enable = true;
  
  # Add user to docker group (will be handled in user config)
  users.users.adambyrne.extraGroups = [ "docker" ];

  # Programming language configurations
  programs.git = {
    enable = true;
    package = pkgs.git;
  };

  # Node.js global packages location
  environment.variables = {
    NODE_PATH = "$HOME/.npm-global/lib/node_modules";
    PATH = "$HOME/.npm-global/bin:$PATH";
  };
}