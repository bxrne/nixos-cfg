{ config, pkgs, ... }:

{
  home.username = "adambyrne";
  home.homeDirectory = "/home/adambyrne";
  home.stateVersion = "23.11";

  # Home packages
  home.packages = with pkgs; [
    # Additional development tools via home-manager
    lazygit
    gh
    
    # Terminal utilities
    fzf
    starship
    zoxide
    
    # Media
    vlc
    
    # Communication
    discord
    slack
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Adam Byrne";
    userEmail = "adam@example.com"; # Replace with actual email
    extraConfig = {
      init.defaultBranch = "main";
      push.default = "simple";
      pull.rebase = true;
    };
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ll = "eza -l";
      la = "eza -la";
      lt = "eza --tree";
      cat = "bat";
      grep = "rg";
      find = "fd";
    };
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "golang" "python" "node" ];
      theme = "robbyrussell";
    };
  };

  # Alacritty terminal configuration
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.9;
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
        size = 12;
      };
      colors = {
        primary = {
          background = "#1e1e2e";
          foreground = "#cdd6f4";
        };
      };
    };
  };

  # Starship prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$all$character";
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  # Neovim configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}