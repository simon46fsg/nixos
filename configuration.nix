{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      ./xkb-symbols/xkb-symbols.nix
      ./hypr/hyprland.nix
    ];

  boot.loader = {
      grub.enable = true;
      grub.efiSupport = true;
      grub.device = "nodev";
      timeout = 1;
      efi.canTouchEfiVariables = true;
  };

  networking.hostName = "nixos-simon"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  
  # display manager stuff
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

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
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "simon" = import ./home.nix;
    };
  };

  stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      cursor.package = pkgs.bibata-cursors;
      cursor.name = "Bibata-Modern-Ice";
      fonts = {
          monospace.package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
          monospace.name = "JetBrainsMono Nerd Font Mono";
          sansSerif.package = pkgs.dejavu_fonts;
          sansSerif.name = "Dejavu Serif";
          serif.package = pkgs.dejavu_fonts;
          serif.name = "Dejavu Serif";
      };
      opacity = {
          applications = 0.9;
          terminal = 0.9;
          desktop = 0.9;
          popups = 0.9;
      };
  };

  programs.steam.enable = true;

  # something about running dynamically linked stuff (i dont really get it)
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
    xorg.xkbcomp
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.05"; # Did you read the comment? (probably just leave it)
}
