{ pkgs, inputs, ... }: 
{
  imports =
    [
       ./waybar/waybar.nix 
    ];

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
}
