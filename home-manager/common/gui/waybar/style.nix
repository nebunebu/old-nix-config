{config, ...}: {
  programs.waybar = {
    style = with config.colorScheme.colors;
    /*
    css
    */
      ''
        * {
          border: none;
          border-radius: 5px;
          font-family: "HeavyData Nerd Font Propo", "Font Awesome 6 Free",  "Source Code Pro";
          font-size: 15px;
        }

        tooltip * {
          font-family: "ProFont Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
        }

        tooltip {
          color: #${base04};
          background-color: #${base00};
          border-radius: 5px;
          border: 2px solid #${base09};
        }

        menu * {
          font-family: "ProFont Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
        }

        menu {
          color: #${base04};
          background-color: #${base00};
          border-radius: 5px;
          border: 2px solid #${base09};
        }

        window#waybar {
           background-color: rgba(0, 0, 0, 0.0);
           color: #${config.colorScheme.colors.base00};
        }

        button {
            box-shadow: inset 0 -3px transparent;
            /* border: 2px solid #${base09}; */
            border: none;
            border-radius: 5px;
        }

        button:hover {
            background: #${config.colorScheme.colors.base0C};
            box-shadow: inset 0 -3px #${config.colorScheme.colors.base0C};
        }

        #workspaces button {
            padding: 0px 5px;
            background-color: #${config.colorScheme.colors.base0B};
            color: #${config.colorScheme.colors.base00};
            margin: 0 1px;
        }

        #workspaces button:hover {
        		box-shadow: inherit;
        		text-shadow: inherit;
            background-color: #${config.colorScheme.colors.base0C};
            color: #${config.colorScheme.colors.base00};
        }


        #workspaces button.urgent {
            background-color: #${config.colorScheme.colors.base09};
        }

        #workspaces button.focused,
        #workspaces button.active
        {
            background-color: #${config.colorScheme.colors.base0D};
            color: #${config.colorScheme.colors.base00};
        }

        #custom-notification,
        #custom-waybarmpris,
        #custom-mic,
        #pulseaudio,
        #battery,
        #tray,
        #clock {
            padding: 0 10px;
            color: #${config.colorScheme.colors.base00};
            background: #${config.colorScheme.colors.base0A};
            border-radius: 5px;
            margin: 0 1px;
        }


        #custom-waybarmpris {
          font-family: "DroidSansMono Nerd Font", "Font Awesome 6 Free", "Source Code Pro";
          background: #${config.colorScheme.colors.base0C};
        }

        #custom-waybarmpris.paused {
          background: #${config.colorScheme.colors.base04};
        }

        #tray {
          background: #${config.colorScheme.colors.base04};
        }


        #pulseaudio.source-muted {
            background-color: #${config.colorScheme.colors.base08};
        }

        #pulseaudio.muted {
            background-color: #${config.colorScheme.colors.base08};
        }

        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }
      '';
  };
}
