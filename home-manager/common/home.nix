{
  inputs,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./non-gui
    ./xdg.nix
    ./services
  ];

  # programs.nix-index-database.comma.enable = true;
  # programs.nix-index.enable = true;

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
    # package = ;
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
    packages = with pkgs; [
      (callPackage ../../pkgs/trekscii.nix {})

      # TODO: mkdir for nix specific stuff
      alejandra
      nix-prefetch-github
      nix-search-cli
      ffmpeg

      unicode-emoji
      (nerdfonts.override {
        fonts = [
          "ProFont"
          "DroidSansMono"
          "HeavyData"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
