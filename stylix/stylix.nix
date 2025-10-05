{ config, pkgs, inputs, ... }:
{
  stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
      #cursor.package = pkgs.bibata-cursors;
      #cursor.name = "Bibata-Modern-Ice";
      fonts = {
          monospace.package = pkgs.nerd-fonts.jetbrains-mono;
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
      image = ./bear-wallpaper.jpg;
  };
}

