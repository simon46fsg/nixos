{ pkgs, inputs, ... }: 
{
      programs.waybar.style = /*css*/ '' 
  
        * {
          font-family: JetBrains Mono, JetBrainsMono Nerd Font, Material Design Icons;
          font-size: 17px; 
          border: none;
          border-radius: 0;
          min-height: 0;
        }

        window#waybar {
          background-color: rgba(26, 27, 38, 0.5);          
          color: #ffffff;
          transition-property: background-color;
          transition-duration: 0.5s;
        }

        /* General styling for individual modules */
        #clock,
        #temperature,
        #mpris,
        #cpu,
        #memory,
        #tray,
        #workspaces,
        #custom-launcher,
        #custom-weather,
        #custom-wg {
          background-color: #222034;
          font-size: 14px;
          color: #8a909e;
          padding: 3px 8px;
          border-radius: 8px;
          margin: 8px 2px;
        }

        /* Styling for Network, Pulseaudio, Backlight, and Battery group */
        #pulseaudio{
          background-color: #222034;
          font-size: 20px;
          padding: 3px 14px 3px 10px;
          border-radius: 8px;
          margin: 8px 2px;
        }
        #pulseaudio.muted {
          color: #fb958b;
          background-color: #222034;
          font-size: 20px;
          padding: 3px 14px 3px 10px;
          border-radius: 8px;
          margin: 8px 2px;
        }


        #backlight{
          background-color: #222034;
          font-size: 20px;
          padding: 3px 14px 3px 8px;
          border-radius: 8px;
          margin: 8px 2px;
        }

        #battery {
          background-color: #222034;
          font-size: 20px;
          padding: 3px 12px 3px 12px;
          border-radius: 8px;
          margin: 8px 2px;
        }

        /* Module-specific colors for Network, Pulseaudio, Backlight, Battery */
        #network, #pulseaudio { color: #5796E0; }
        #backlight { color: #ecd3a0; }
        #battery { 
        color: #8fbcbb;
        }

        /* Battery state-specific colors */
        #battery.warning { color: #ecd3a0; }
        #battery.critical:not(.charging) { color: #fb958b; }

        /* Styling for Language, Custom Wallpaper, Idle Inhibitor, Custom Refresh Rate group */
        #language,
        #custom-refresh-rate,
        #custom-wallpaper,
        #idle_inhibitor {
          background-color: #222034;
          color: #8a909e;
          padding: 3px 4px;
          margin: 8px 2px;
        }
        #idle_inhibitor { border-radius: 8px 8px 8px 8px; }

        /* Rounded corners for specific group elements */
        #network { border-radius: 8px 0 0 8px; }

        /* Temperature, CPU, and Memory colors */
        #temperature { color: #5796E0; }
        #cpu { color: #fb958b; }
        #memory { color: #a1c999; }

        /* Workspaces active button styling */
        #workspaces button {
          color: #5796E0;
          border-radius: 8px;
          box-shadow: inset 0 -3px transparent;
          padding: 3px 4px;
          transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
        }
        #workspaces button.active {
          color: #ecd3a0;
          font-weight: bold;
          border-radius: 8px;
          transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
        }

        #idle_inhibitor.activated {
          background-color: #ecf0f1;
          color: #2d3436;
          border-radius: 8px;
          margin: 8px 2px;
        }

        /* Custom launcher */
        #custom-launcher {
          color: #5796E0;
          font-size: 22px;
          padding-right: 14px;
        }

        /* Tooltip styling */
        tooltip {
          border-radius: 15px;
          padding: 15px;
          background-color: #222034;
        }
        tooltip label {
          padding: 5px;
          font-size: 14px;
          }

  '';
}
