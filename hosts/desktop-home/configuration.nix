{ config, pkgs, inputs, ... }:

{
  networking.hostName = "desktop-home"; # Define your hostname.
  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
}
