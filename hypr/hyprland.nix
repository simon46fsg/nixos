{ pkgs, inputs, ... }: 
{
    programs.hyprland.enable = true;
    # programs.dconf.enable = true;

    hardware.graphics.enable = true;

    environment.systemPackages = with pkgs;  [
        dunst #notification demon
        libnotify #dunst depends on this (dont get why i need to declare this)
        swww #for wallpapers
        rofi #application launcher
        waybar #status bar
        networkmanagerapplet #manage connections
        kitty #incase the default config is loaded

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
