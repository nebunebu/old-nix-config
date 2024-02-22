{ outputs
, config
, ...
}:
let
  # wDir = "${config.home.homeDirectory}/.nix-config/home-manager/common/gui/theme/wallpapers";
  outPath = "${config.xdg.configHome}/wallpapers"; # Where in your home directory to output to.
in
{
  imports = [
    outputs.homeManagerModules.swww
  ];

  programs.swww = [
    {
      monitor = "DP-1";
      wallpaper = "${outPath}/wallhaven-5gjwv1.jpg";
    }
    {
      monitor = "DP-2";
      wallpaper = "${outPath}/wallhaven-g71vdq.jpg";
    }
  ];
}
