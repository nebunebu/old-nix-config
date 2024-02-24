{ pkgs, inputs, ... }:

{
  imports = [
    ./hypr-settings
    # ./contrib
    # ./plugins
    # ./pyprland
  ];

  wayland.windowManager.hyprland = {
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
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

  home.packages = builtins.attrValues {
    # pkgs.libsForQt5.polkit-kde-agent
    inherit
      (pkgs)
      swww
      wl-clipboard
      wf-recorder
      grim
      slurp
      wev
      ;
  };
}
