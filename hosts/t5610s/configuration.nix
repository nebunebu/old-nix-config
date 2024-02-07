{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ./impermanence.nix
    ./disko.nix
  ];

  users.users."nebu".initialPassword = "1";
  networking.hostName = "t5610s";
  home-manager.users.nebu =
    import ../../home-manager/t5610/home.nix;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "t5610s";
  };

  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      adminIdentities = ["unix-group:wheel"];
    };
  };
}
