{
  inputs,
  pkgs,
  ...
}: {

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./term/default.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
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
