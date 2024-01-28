{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../common/non-gui/git/default.nix
    ../common/non-gui/nixvim/default.nix
    ../common/non-gui/fzf/default.nix
    ../common/non-gui/zsh/default.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      ripgrep-all
    ];
  };
  programs.home-manager.enable = true;
  programs.git.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
