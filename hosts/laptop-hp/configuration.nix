{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../configuration.nix
    ];
  networking.hostName = "laptop-hp"; # Define your hostname.
}
