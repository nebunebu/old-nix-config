{ outputs
, config
, ...
}:
let
  wDir = "${config.home.homeDirectory}/.nix-config/home-manager/common/gui/theme/wallpapers";
in
{
  imports = [
    outputs.homeManagerModules.swww
  ];

  programs.swww = [
    {
      monitor = "LVDS-1";
      wallpaper = "${wDir}/wallhaven-qzpv5q.jpg";
    }
  ];
}
# wallpaper_1 = /home/nebu/Media/Wallpapers/wallhaven-d6vm2l.jpg;
# wallpaper_2 = /home/nebu/Media/Wallpapers/wallhaven-qzpv5q.jpg;
# wallpaper_3 = /home/nebu/Media/Wallpapers/wallhaven-exvprr.jpg;
