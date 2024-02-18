{ pkgs, ... }: {
  imports = [
    ../../../home-manager/common.nix
    ../../../home-manager/hypr
    ../../../home-manager/programs/nixvim
    ../../../home-manager/programs/zsh
    ../../../home-manager/programs/nix-direnv
    ../../../home-manager/programs/fzf
    ../../../home-manager/programs/tmux
    ../../../home-manager/programs/git
    ../../../home-manager/programs/kitty
    ../../../home-manager/programs/fuzzel
    ../../../home-manager/programs/mpv
    ../../../home-manager/programs/ytfzf
    ../../../home-manager/programs/newsraft
    ../../../home-manager/programs/firefox
    ../../../home-manager/programs/chromium
    ../../../home-manager/theme
    ../../../home-manager/programs/ags
    ../../../home-manager/programs/taskwarrior
    ../../../home-manager/programs/sioyek

    ./hyprland
    ./swww
    # ./waybar
  ];

  home.packages = with pkgs; [
    unstable.webcord-vencord

    # For ags
    playerctl
    unstable.libdbusmenu-gtk3
  ];
}
