{
  inputs,
  pkgs,
  outputs,
  ...
}: {

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./non-gui/default.nix
  ];

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
      nix-prefetch-github
      nix-search-cli

      (nerdfonts.override { fonts = [
        "DroidSansMono"
        "JetBrainsMono"
        "HeavyData"
      ]; })
    ];
  };

  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
