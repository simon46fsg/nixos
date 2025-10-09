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

    # GTK theming settings
    gtk = {
        #enable = true;
        #Icon Theme
        iconTheme = {
            #package = pkgs.adwaita-icon-theme;
            #name = "Adwaita";
            # package = pkgs.kdePackages.breeze-icons;
            # name = "Breeze-Dark";
        };
    };

    programs.alacritty = {
        enable = true;
        settings = {
            window.padding.x = 4;
        };
    };

    home.packages = with pkgs; [
      waypipe
      wf-recorder
      wl-mirror
      wl-clipboard
      wlogout
      wtype
      wttrbar
      ydotool
      playerctl
      brightnessctl
      kdePackages.kdeconnect-kde
      #pamixer
      pavucontrol # Volume control
      jellyfin-ffmpeg # Multimedia libs


    ];
}
