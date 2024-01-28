{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./nixvim/default.nix
    ./tmux/default.nix
    ./zsh/default.nix
    ./git/default.nix
    ./fuzzel/default.nix
    ./hypr/default.nix
    ./mpv/default.nix
    ./waybar/default.nix
    ./kitty/default.nix
    ./sioyek/default.nix
    ./chromium/default.nix
    ./firefox/default.nix
    ./fzf/default.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.rose-pine;

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
