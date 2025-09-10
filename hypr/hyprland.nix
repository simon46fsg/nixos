{ pkgs, inputs, ... }: 
{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    hardware.opengl.enable = true;

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    environment.systemPackages = with pkgs;  [
        dunst #notification demon
        libnotify #dunst depends on this (dont get i need to declare this)
        swww #for wallpapers
        rofi-wayland #application launcher
        waybar #status bar
        networkmanagerapplet #manage connections
    ];
}
