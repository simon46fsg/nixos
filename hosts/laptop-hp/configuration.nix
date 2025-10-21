{ config, pkgs, inputs, ... }:

{
  networking.hostName = "laptop-hp"; # Define your hostname.
  
  #sleep setup
  powerManagement.enable = true;
  #services.logind.lidSwitch = "suspend-then-hibernate";
  services.logind.settings.Login.HandleLidSwitch = "suspend-then-hibernate";
  #services.acpid.lidEventCommands = "hyprlock";
  systemd.sleep.extraConfig = "HibernateDelaySec=20min";
  swapDevices = [{
    device = "/swapfile";
    size = 8 * 1024; # 8GB
  }];
  boot.initrd.systemd.enable = true;

  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
}
