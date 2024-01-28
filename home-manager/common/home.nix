{
  inputs,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./nix
    ./non-gui
    ./gui
    ./services
    ./xdg.nix
  ];

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
  };

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  programs.go = {
    enable = true;
    goBin = ".config/go/bin.go";
    goPath = ".config/go/go";
  };

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = builtins.attrValues {
      nerdfonts =
        pkgs.callPackage
        (pkgs.nerdfonts.override {
          fonts = [
            "DroidSansMono"
            "JetBrainsMono"
            "HeavyData"
          ];
        });
      inherit
        (pkgs)
        ripgrep-all
        distrobox
        swaynotificationcenter
        ytfzf
        libnotify
        ;
    };
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
