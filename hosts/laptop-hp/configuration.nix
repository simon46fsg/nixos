{ config, pkgs, inputs, ... }:

{
  networking.hostName = "laptop-hp"; # Define your hostname.
  
  #sleep setup
  #services.logind.lidSwitch = "suspend-then-hibernate";
  swapDevices = [{
    device = "/swapfile";
    size = 8 * 1024; # 8GB
  }];

  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
}
