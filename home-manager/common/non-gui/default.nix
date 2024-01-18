{
  inputs,
  pkgs,
  ...
}: {

  imports = [
    ./nixvim/default.nix
    ./tmux/default.nix
    ./taskwarrior/default.nix
    ./kitty/default.nix
    ./zsh/default.nix
    ./git/default.nix
    ./fzf/default.nix
  ];

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      ytfzf
      ripgrep-all
      distrobox
    ];
  };

  programs.go = {
    enable = true;
    goBin = ".config/go/bin.go";
    goPath = ".config/go/go";
  };

  programs.git.enable = true;
}
