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

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";

    packages = [
      pkgs.invidtui
      (pkgs.nerdfonts.override {
        fonts = [
          "DroidSansMono"
          "JetBrainsMono"
          "HeavyData"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;
  programs.bash.enable = true;
  # programs.git.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
