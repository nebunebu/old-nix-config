{ inputs, ... }:
{
  home.packages = [ inputs.pyprland.packages.x86_64-linux.default ];

  xdg.configFile."pyprland.toml" = {
    source = ./pyprland.toml;
    target = "hypr/pyprland.toml";
  };

  wayland.windowManager.hyprland = {
    settings = {
      windowrulev2 = [
        "float, class:^(kitty-btm)$"
        "float, class:^(spotube)$"
        # "center, class:^(mpv)$"
        # "animation popin, class:^(mpv)$"
        # "size 85%, class:^(mpv)$"
        #
        # "float, class:^(firefox)$"
        # "center, class:^(firefox)$"
        # "animation popin, class:^(firefox)$"
        # "size 85%, class:^(firefox)$"
      ];
      bind = [
        # "$mainMod+ALT_L, L, movewindow, mon:DP-2"
        # "$mainMod, c, exec, pypr toggle btm"
        "$mainMod, c, exec, pypr toggle spo"
      ];

    };

    extraConfig = ''
      bind = $mainMod, S, submap, scratchpad
      submap = scratchpad

      bind = , B, exec, pypr show btm
      bind = , S, exec, pypr show spo

      bind = , escape, exec, pypr hide btm
      bind = , escape, exec, pypr hide spo
      bind = , escape, submap, reset
      submap = reset
    '';
  };
}
