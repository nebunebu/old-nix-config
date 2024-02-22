{ pkgs, ... }:
{
  imports = [
    ../common/home.nix
    ./swww
    ./hyprland
    ./waybar
  ];

  home.packages = [ pkgs.unstable.newsraft ];
}
