{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    inputs.hyprland-contrib.packages.${pkgs.system}.shellevents
    inputs.hyprland-contrib.packages.${pkgs.system}.try_swap_workspace
    inputs.hyprland-contrib.packages.${pkgs.system}.scratchpad
    inputs.hyprland-contrib.packages.${pkgs.system}.hdrop
  ];

  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      # bottom
      "float, class:^(btm-hdrop)$"
      "animation slidevert, class:^(btm-hdrop)$"
      "center, class:^(btm-hdrop)$"
      "size 80%, class:^(btm-hdrop)$"
      # noogle
      # "float, class:^(noogle-hdrop)$"
      # "animation slidevert, class:^(noogle-hdrop)$"
      # "center, class:^(noogle-hdrop)$"
      # "size 80%, class:^(noogle-hdrop)$"
      # https://search.nixos.org/packages
      # https://search.nixos.org/options?
      # spotube
      "float, class:^(spotube)$"
      "animation slidevert, class:^(spotube)$"
      "center, class:^(spotube)$"
      "size 90%, class:^(spotube)$"
    ];
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, B, exec, hdrop kitty --class \"btm-hdrop\" btm"
      "$mainMod, S, exec, hdrop spotube"
      "$mainMod, N, exec, hdrop firefox --class noogle-hdrop -new-window \"https://noogle.dev\""
    ];
  };
}
