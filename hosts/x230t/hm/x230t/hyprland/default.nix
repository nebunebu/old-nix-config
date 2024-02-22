{
  imports = [ ./hypr-start.nix ];
  wayland.windowManager.hyprland.settings = {
    exec-once = "hypr-start";
    monitor = [
      "LVDS-1, 1366x768, 0x0, 1"
    ];

    workspace = [
      "1, monitor:LVDS-1"
      "2, monitor:LVDS-1"
      "3, monitor:LVDS-1"
      "4, monitor:LVDS-1"
      "5, monitor:LVDS-1"
      "6, monitor:LVDS-1"
      "7, monitor:LVDS-1"
      "8, monitor:LVDS-1"
      "9, monitor:LVDS-1"
    ];
  };
}
