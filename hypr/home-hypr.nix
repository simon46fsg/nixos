{ pkgs, inputs, ... }: 
let
    hyprland-path = builtins.path {
        path = ./hyprland.conf;
        name = "hyprland.conf";
    };
in
{

    # Optional, hint Electron apps to use Wayland:
    home.sessionVariables.NIXOS_OZONE_WL = "1";
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.extraConfig = hyprland-path;
}
