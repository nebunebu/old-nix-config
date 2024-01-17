{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeShellScriptBin "hypr-start" ''
      # /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
      swww init
      swww img -o DP-1 ~/.nix-config/home-manager/t5610/wallpapers/wallhaven-qzpv5q.jpg
      swww img -o DP-2 ~/.nix-config/home-manager/t5610/wallpapers/wallhaven-d6vm2l.jpg
      waybar &
      # jellyfin-mpv-shim &
      wl-clipboard-history -t
      wl-paste --watch cliphist store
    '')
  ];
}
