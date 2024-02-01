{config, ...}: let
  c = config.colorScheme.palette;
in {
  wayland.windowManager.hyprland.settings = {
    "$color-gray0" = "0xff${c.base05}";
    "$color-gray1" = "0xff${c.base03}";
    "$color-gray2" = "0xff${c.base07}";
    "$color-red" = "0xff${c.base08}";
    "$color-yellow" = "0xff${c.base09}";
    "$color-tan" = "0xff${c.base0A}";
    "$color-dteal" = "0xff${c.base0B}";
    "$color-lteal" = "0xff${c.base0C}";
    "$color-purple" = "0xff${c.base0D}";

    general = {
      "gaps_in" = "7";
      "gaps_out" = "8";
      "border_size" = "2";
      # "col.active_border" = "$color-yellow $color-dteal 90deg";
      "col.active_border" = "$color-yellow";
      "col.inactive_border" = "$color-gray2";
      "bezier" = "linear, 0.0, 0.0, 1.0, 1.0";
    };

    decoration = {
      "rounding" = "10";
      "active_opacity" = "1";
      "inactive_opacity" = "1";
    };

    animations = {
      "enabled" = "yes";
      # "bezier" = [
      #   "myBezier, 0.05, 0.9, 0.1, 1.05"
      # ];
      # "animation" = [
      #   # "windows, 1, 7, myBezier"
      #   "borderangle, 1, 70, linear, loop"
      #   # "windowsOut, 1, 7, default, popin 80%"
      #   # "border, 1, 10, default"
      #   # "borderangle, 1, 8, default"
      #   # "fade, 1, 7, default"
      #   # "workspaces, 1, 6, default"
      # ];
    };

    windowrulev2 = [
      "bordercolor $color-purple, fullscreen:1"
      "bordercolor $color-lteal, floating:1"
      "bordercolor $color-red, pinned:1"
    ];
  };
}
