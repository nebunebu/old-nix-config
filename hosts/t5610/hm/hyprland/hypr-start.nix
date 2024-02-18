{pkgs, ...}: {
  # This can probably just be put in common/home.nix
  home.packages = [
    (pkgs.writeShellScriptBin "hypr-start" ''
      # /nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1 &
      ${pkgs.swww}/bin/swww init
      # ${pkgs.waybar}/bin/waybar &
      ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch cliphist store
      ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch cliphist store
    '')
  ];
}
