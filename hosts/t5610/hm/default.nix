{pkgs, ...}: {
  imports = [
    ../../../home-manager/common.nix
    ../../../home-manager/hypr
    ../../../home-manager/programs/nixvim
    ../../../home-manager/programs/zsh
    ../../../home-manager/programs/git
    ../../../home-manager/programs/mpv
    ../../../home-manager/programs/ytfzf

    ./hyprland
    ./swww
    ./waybar
  ];

  home.packages = with pkgs; [
    unstable.webcord
  ];
}
