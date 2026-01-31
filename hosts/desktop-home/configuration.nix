{ config, pkgs, inputs, ... }:

{
  networking.hostName = "desktop-home"; # Define your hostname.
  boot.initrd.systemd.enable = true;
  powerManagement.enable = true;
  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
}
