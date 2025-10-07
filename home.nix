{ config, pkgs, ... }:

{
  imports =
    [
       ./hypr/home-hypr.nix 
    ];

  # TODO please change the username & home directory to your own
  home.username = "simon";
  home.homeDirectory = "/home/simon";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    google-chrome
    discord
    spotify
    thunderbird
    keepassxc
    ranger
    nnn # terminal file manager
    nautilus

    # kde stuff
    kdePackages.okular

    libreoffice
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    fzf # A command-line fuzzy finder
    pavucontrol

    # misc
    which
  ];

    home.sessionVariables = {
        EDITOR = "nvim";
        BROWSER = "google-chrome-stable";
        TERMINAL = "alacritty";
        HYPRSHOT_DIR="$HOME/Pictures/Screenshots";
    };
    xdg = {
        terminal-exec.enable = true;
        terminal-exec.settings.default = [ "alacritty.desktop" ];
        portal.enable = true;
        mimeApps.enable = true;
        mimeApps.defaultApplications = {
            "text/plain" = [ "nvim.desktop" ];
            "application/pdf" = [ "okular.desktop" ];
            "image/jpeg" = [ "okular.desktop" ];
            "image/png" = [ "okular.desktop" ];
        };
        desktopEntries = {
            nvim = {
                name = "nvim";
                exec = "nvim";
                terminal = true;
                type = "Application";
            }; 
            nnn = {
                name = "nnn";
                exec = "nnn";
                terminal = true;
                type = "Application";
            }; 
            okular = {
                name = "okular";
                exec = "okular";
                terminal = false;
                type = "Application";
            }; 
        };
    };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "simon";
    userEmail = "simon46fsg@gmail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    theme = "rose_pine";
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      # window.opacity = 0.9;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      sudo = "sudo ";
      nr = "nixos-rebuild switch --flake ~/mysystem/nixos#simons-nixos";
    };
  };

  home.stateVersion = "25.05";
}
