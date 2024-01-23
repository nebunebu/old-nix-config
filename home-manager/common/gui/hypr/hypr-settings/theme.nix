{ config, ...}:

{
  # NOTE: cleaner to use `opt = with config.colorScheme.colors; {...};`
  wayland.windowManager.hyprland.settings = {
    "$color-gray0"  = "0xff${config.colorScheme.colors.base05}";
    "$color-gray1"  = "0xff${config.colorScheme.colors.base03}";
    "$color-gray2"  = "0xff${config.colorScheme.colors.base07}";
    "$color-red"    = "0xff${config.colorScheme.colors.base08}";
    "$color-yellow" = "0xff${config.colorScheme.colors.base09}";
    "$color-tan"    = "0xff${config.colorScheme.colors.base0A}";
    "$color-dteal"  = "0xff${config.colorScheme.colors.base0B}";
    "$color-lteal"  = "0xff${config.colorScheme.colors.base0C}";
    "$color-purple" = "0xff${config.colorScheme.colors.base0D}";

    general = {
      "gaps_in" = "7";
      "gaps_out" = "8";
      "border_size" = "2";
      "col.active_border" = "$color-yellow";
      "col.inactive_border" = "$color-gray2";
    };

    decoration = {
      "rounding" = "10";
      "active_opacity" = "1";
      "inactive_opacity" = "1";
    };

    animations = {
      "enabled" = "yes";
    };
  };
}
