{ pkgs, inputs, ... }:

{
  imports = [
    ./hyprland.nix
    ./hypr-settings/default.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "-all" ];
    };
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  home.packages = with pkgs; [
    libsForQt5.polkit-kde-agent
    wl-clipboard
    wf-recorder
    grim
    slurp
    wev
  ];
}
