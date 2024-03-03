{ pkgs
, inputs
, ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
    ./hydra.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-19.1.9"
  ];

  networking.hostName = "t5610";
  home-manager.users.nebu = import ./hm;

  programs.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages."${pkgs.system}".hyprland;
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

  # programs.seahorse.enable = true;
  environment.systemPackages = with pkgs; [
    etcher
    pass-wayland
    qtpass
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-checkup
  ];
}
