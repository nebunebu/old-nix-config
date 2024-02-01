{pkgs, ...}: {
  imports = [
    ./theme
    ./fuzzel
    ./hypr
    ./mpv
    ./sioyek
    ./chromium
    ./firefox
  ];

  services.cliphist.enable = true;
  home = {
    packages = [
      pkgs.unstable.spotube
    ];
  };
}
