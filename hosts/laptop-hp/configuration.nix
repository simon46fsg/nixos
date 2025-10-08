{ config, pkgs, inputs, ... }:

{
  networking.hostName = "laptop-hp"; # Define your hostname.
  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
}
