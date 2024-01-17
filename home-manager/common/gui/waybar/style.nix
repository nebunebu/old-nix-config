{ config, ... }:

{
  programs.waybar = {
    style = /* css */ ''
* {
  border: none;
  border-radius: 0;
  font-family:  "HeavyData Nerd Font Propo", "Font Awesome 6 Free", "Source Code Pro";
  font-size: 15px;
}

window#waybar {
   background-color: rgba(0, 0, 0, 0.0);
   color: #${config.colorScheme.colors.base00};
}

button {
    box-shadow: inset 0 -3px transparent;
    border: none;
    border-radius: 6px;
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
