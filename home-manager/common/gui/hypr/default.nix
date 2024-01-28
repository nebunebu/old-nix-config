{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hypr-settings/default.nix
    # ./plugins/default.nix
  ];

  wayland.windowManager.hyprland = {
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["-all"];
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
