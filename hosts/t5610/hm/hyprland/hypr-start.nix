{ pkgs, config, ... }: {
  home.packages = [
    pkgs.swww
    pkgs.cliphist
    (pkgs.writeShellScriptBin "hypr-start" ''
      # /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
      # ${pkgs.waybar}/bin/waybar &
      ${config.home.homeDirectory}/.nix-profile/bin/pypr &
      ${config.home.homeDirectory}/.nix-profile/bin/ags &
      ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store &
      ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store &
      ${pkgs.swww}/bin/swww init
    '')
  ];
}
