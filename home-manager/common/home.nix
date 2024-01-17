{
  inputs,
  pkgs,
  ...
}: {

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./non-gui/default.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      nix-prefetch-github
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
