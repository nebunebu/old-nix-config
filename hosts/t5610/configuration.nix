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

  boot.initrd.services.udev.rules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="1f3a", ATTR{idProduct}=="1006", MODE="0666", GROUP="plugdev"
  '';

  networking.hostName = "t5610";
  home-manager.users.nebu = import ./hm;

  programs.solaar.enable = true;

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

  services.ratbagd.enable = true;
  environment.systemPackages = with pkgs; [
    android-tools
    unstable.piper
    pavucontrol
    etcher
    pass-wayland
    qtpass
    passExtensions.pass-otp
    passExtensions.pass-import
    passExtensions.pass-checkup
  ];
}
