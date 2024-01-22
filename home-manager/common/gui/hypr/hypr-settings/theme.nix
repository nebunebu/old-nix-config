{ config, ...}:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      "gaps_in" = "7";
      "gaps_out" = "8";
      "border_size" = "2";
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
