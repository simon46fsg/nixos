{ pkgs, inputs, ... }: 
{

    # Optional, hint Electron apps to use Wayland:
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.conf;

    home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  qt = {
      enable = true;
      style.name = "adwaita-dark";
      style.package = pkgs.adwaita-qt;
  };
}
