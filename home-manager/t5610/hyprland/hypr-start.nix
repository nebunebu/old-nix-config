{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "hypr-start" ''
      # /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
      ${pkgs.swww}/bin/swww init
      ${pkgs.swww}/bin/swww img -o DP-1 /home/nebu/Media/Wallpapers/wallhaven-qzpv5q.jpg
      ${pkgs.swww}/bin/swww img -o DP-2 /home/nebu/Media/Wallpapers/wallhaven-d6vm2l.jpg
      ${pkgs.waybar}/bin/waybar &
      # wl-clipboard-history -t
      # ${pkgs.wl-clipboard}/bin/wl-paste --watch cliphist store
    '')
  ];
}
