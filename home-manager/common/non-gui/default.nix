{
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
    ./tuir/default.nix
    ./newsboat/default.nix
  ];

  home = {
    username = "nebu";
    homeDirectory = "/home/nebu";
    packages = with pkgs; [
      ytfzf
      ripgrep-all
      lazygit
      distrobox
      pup
      lazygit
    ];
  };

  programs.go = {
    enable = true;
    goBin = ".config/go/bin.go";
    goPath = ".config/go/go";
  };

  programs.git.enable = true;
}
