{ pkgs, inputs, ... }: 
{
    programs.hyprland.enable = true;
    # programs.dconf.enable = true;

    hardware.graphics.enable = true;

    environment.systemPackages = with pkgs;  [
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

        # Gnome Stuff
        gtk-engine-murrine
        gnome-software
        gnome-disk-utility
        gnome-text-editor
        file-roller
        gnome-calculator
        nautilus # Gnome file manager
        gnome-system-monitor
    ];

}
