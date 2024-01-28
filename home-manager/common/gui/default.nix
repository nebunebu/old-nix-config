{pkgs, ...}: {
  imports = [
    ./theme/default.nix
    ./fuzzel/default.nix
    ./hypr/default.nix
    ./mpv/default.nix
    ./waybar/default.nix
    ./sioyek/default.nix
    ./chromium/default.nix
    ./firefox/default.nix
    ./swaync/default.nix
  ];

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = builtins.attrValues {
      inherit
        (pkgs)
        swww
        spotube
        swaynotificationcenter
        waybar-mpris
        ;
    };
  };
}
