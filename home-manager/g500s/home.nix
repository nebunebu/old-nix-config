{
  inputs,
  pkgs,
  ...
}: {

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ../common/git/default.nix
    ../common/nixvim/default.nix
    ../common/fzf/default.nix
    ../common/zsh/default.nix
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
