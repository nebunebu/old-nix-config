{ config, ...}:

{
  wayland.windowManager.hyprland.settings = {
    "$color7"  = "0xff${config.colorScheme.colors.base07}";
    "$color9"  = "0xff${config.colorScheme.colors.base09}";
    "$color13" = "0xff${config.colorScheme.colors.base0D}";

    general = {
      "gaps_in" = "7";
      "gaps_out" = "8";
      "border_size" = "2";
      # "col.active_border" = "$color9 $color13 120deg";
      "col.active_border" = "$color9";
      "col.inactive_border" = "$color7";
      # "bezier" = "linear, 0.0, 0.0, 1.0, 1.0";
    };

    decoration = {
      "rounding" = "10";
      # "active_opacity" = "0.98";
      # "inactive_opacity" = "0.95";
      "active_opacity" = "1";
      "inactive_opacity" = "1";
    };

    animations = {
      "enabled" = "yes";
      # "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        # "windows, 1, 7, myBezier"
        # "windowsOut, 1, 7, default, popin 80%"
        # "border, 1, 10, default"
        # "borderangle, 1, 8, default"
        # "fade, 1, 7, default"
        # "workspaces, 1, 6, default"
        # "borderangle, 1, 70, linear, loop"
      ];
    };
  };
}
