{pkgs, ...}: {
  imports = [
    ../common/gui/default.nix
    ../common/home.nix
    ./hyprland
    ./swww
    ./waybar
    # ./blahg
  ];

  home.packages = [
    pkgs.smartmontools
    pkgs.tree
  ];
}
