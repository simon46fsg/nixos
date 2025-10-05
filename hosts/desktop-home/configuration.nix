{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuratation.nix
      ../../configuratation.nix
    ];
}
