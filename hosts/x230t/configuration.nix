{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
  ];

  networking = {
    hostName = "x230";
    networkmanager.enable = true;
  };

  home-manager.users.nebu =
    import ../../home-manager/x230t/home.nix;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "x230";
  };
}
