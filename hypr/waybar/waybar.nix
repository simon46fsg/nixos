{ pkgs, inputs, ... }: 
{

  imports = [ ./waybar-css.nix ];

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          height = 20;
          layer = "top";
          modules-left = [ "custom/launcher" "cpu" "memory" "custom/weather" ];
          modules-center = [ "mpris" ];
          modules-right = [ "backlight" "pulseaudio" "battery" "tray" "idle_inhibitor" "clock" ];

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
            format = "🤖 {usage}%";
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
        format = "{icon} <small>{volume}%</small>";
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
        };
      };
  };
}
