{
  outputs,
  config,
  ...
}: let
  wDir = "${config.home.homeDirectory}/.nix-config/home-manager/common/gui/theme/wallpapers";
in {
  imports = [
    outputs.homeManagerModules.swww
  ];

  programs.swww = [
    {
      monitor = "DP-1";
      wallpaper = "${wDir}/wallhaven-qzpv5q.jpg";
    }
    {
      monitor = "DP-2";
      wallpaper = "${wDir}/wallhaven-d6vm2l.jpg";
    }
  ];
}
