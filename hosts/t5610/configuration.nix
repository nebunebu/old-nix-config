{ pkgs
, inputs
, ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ./hydra.nix
    inputs.solaar.nixosModules.default
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-19.1.9"
  ];

  networking.hostName = "t5610";
  home-manager.users.nebu = import ./hm;

  programs.solaar.enable = true;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  environment.sessionVariables = {
    HOSTNAME = "t5610";
  };

  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      adminIdentities = [ "unix-group:wheel" ];
    };
  };

  services.ratbagd.enable = true;
  # programs.seahorse.enable = true;
  environment.systemPackages = with pkgs; [
    piper
    pavucontrol
    etcher
    pass-wayland
    qtpass
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-checkup
  ];
}
