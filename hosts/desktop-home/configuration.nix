{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
  networking.hostName = "desktop-home"; # Define your hostname.
}
