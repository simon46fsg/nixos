{ config, pkgs, inputs, ... }:

{
  networking.hostName = "desktop-home"; # Define your hostname.
  boot.initrd.systemd.enable = true;
  boot.kernelParams = [ "usbcore.autosuspend=-1" ];
  powerManagement.enable = true;
  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
}
