{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      inputs.home-manager.nixosModules.default
      ./xkb-symbols/xkb-symbols.nix
      ./hypr/hyprland.nix
      ./stylix/stylix.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # region stuff
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  #nixos helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 10d --keep 3";
    flake = "/home/simon/nixos"; # sets NH_OS_FLAKE variable for you
  };
  
  # display manager stuff
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "simon";

  #bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # setup user
  users.users.simon = {
    isNormalUser = true;
    description = "simon";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "simon" = import ./home.nix;
    };
  };

  programs.steam.enable = true;

  # something about running dynamically linked stuff (i think this could be used for python)
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    #Add missing dynamic libraries unpackaged programs here
  ];

  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pcloud
    git
    clang
    rustup
    lutris

    gparted
    distrobox
    podman
    vscode
    microsoft-edge
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment? (probably just leave it)
}
