{ pkgs, inputs, ... }: 
{

  imports = [ ./waybar-css.nix ];

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          height = 20;
          layer = "top";
          modules-left = [ "custom/launcher" "cpu" "memory" "custom/weather" "hyprland/workspaces" ];
          modules-center = [ "mpris" ];
          modules-right = [ "pulseaudio" "backlight" "battery" "tray" "idle_inhibitor" "clock" ];

          "hyprland/workspaces" = {
            format = "{name}";
            all-outputs = true;
            on-click = "activate";
            format-icons = {
              active = "󱎴";
              default = "󰍹";
            };
            persistent-workspaces = {
              "1" = [ ];
              "2" = [ ];
              "3" = [ ];
              "4" = [ ];
              "5" = [ ];
              "6" = [ ];
              "7" = [ ];
              "8" = [ ];
              "9" = [ ];
              "10" = [ ];
            };
          };

          "hyprland/language" = {
            format = "{}";
            format-ar = "🇰🇼 ";
            format-en = "🇬🇧 ";
          };

          "tray" = {
            spacing = 10;
          };

          "clock" = {
            format = "{:%H:%M %d.%m.%Y}";
            format-alt = "{:%b %d %Y}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };

          "cpu" = {
            interval = 2;
            format = "🤖 {}%";
            max-length = 10;
          };

          "memory" = {
        interval = 10;
        format = "🧠 {}%";
        format-alt = "🧠 {used:0.1f}GB";
        min-lenght = 10;
        max-length = 10;
      };

      "backlight" = {
        device = "intel_backlight";
        format = "{icon}";
        tooltip = true;
        format-alt = "<small>{percent}%</small>";
        format-icons = [ "󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨" ];
        on-scroll-up = "brightnessctl set 1%+";
        on-scroll-down = "brightnessctl set 1%-";
        smooth-scrolling-threshold = "2400";
        tooltip-format = "Brightness {percent}%";
      };

      "pulseaudio" = {
        format = "{icon}";
        format-muted = "󰖁";
        format-icons = {
          default = [ "" "" "󰕾" ];
        };
        on-click = "exec pavucontrol";
        tooltip-format = "Volume {volume}%";
      };

      "battery" = {
        bat = "BAT0";
        adapter = "ADP0";
        interval = 5;
        states = {
          warning = 15;
          critical = 7;
        };
        max-length = 20;
        format = "{icon} <small>{capacity}%</small>";
        format-warning = "{icon} <small>{capacity}%</small>";
        format-critical = "{icon} <small>{capacity}%</small>";
        format-charging = "<span font-family='Font Awesome 6 Free'></span> <small>{capacity}%</small>";
        format-plugged = "󰚥";
        format-notcharging = "󰚥";
        format-full = "󰂄";
        format-alt = "<small>{capacity}%</small>";
        tooltip-format = "<small>{capacity}%</small>";
        format-alt-warning = "<small>{capacity}%</small>";
        format-critical-alt = "<small>{capacity}%</small>";
        format-icons = [ "󱊡" "󱊢" "󱊣" ];
      };

      "custom/weather" = {
        format = "{}°C";
        tooltip = true;
        interval = 3600;
        exec = "wttrbar --location Innsbruck";
            return-type = "json";
          };

          "mpris" = {
            format = "{player_icon} {title}";
            format-paused = " {status_icon} <i>{title}</i>";
            max-length = 80;
            player-icons = {
              default = "▶";
              mpv = "🎵";
            };
            status-icons = {
              paused = "⏸";
            };
          };

          "custom/refresh-rate" = {
            format = "{percentage}Hz";
            on-click = "~/.config/hypr/scripts/screenHz.sh";
            return-type = "json";
            exec = "cat ~/.config/hypr/scripts/hz.json";
            interval = 1;
            tooltip = false;
          };

          "idle_inhibitor" = {
            format = "{icon}";
            format-icons = {
              activated = " ";
              deactivated = " ";
            };
          };

          "custom/launcher" = {
            format = "󱄅";
            on-click = "rofi -show drun";
          };

          "custom/wallpaper" = {
            format = "󰸉 ";
            on-click = "bash ~/.config/hypr/scripts/changewallpaper.sh";
          };
        };
      };
  };
}
