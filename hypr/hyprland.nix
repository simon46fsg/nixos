{ pkgs, inputs, ... }: 
{
    programs.hyprland.enable = true;
    # programs.dconf.enable = true;

    hardware.graphics.enable = true;

    environment.systemPackages = with pkgs;  [
        libnotify #dunst depends on this (dont get why i need to declare this)
        swaynotificationcenter
        rofi #application launcher
        waybar #status bar
        networkmanagerapplet #manage connections
        kitty #incase the default config is loaded

        hyprshot
        hyprlock
        hypridle
        hyprpaper
        hyprpicker
        xdg-utils

        #sreenshots?
        swappy
        slurp

    ];

}
