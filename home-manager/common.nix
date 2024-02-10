{
  inputs,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
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
      inputs.tuido.packages.x86_64-linux.default

      tree
      nix-output-monitor
      alejandra
      nurl
      comma
      statix
      nix-search-cli
      nix-prefetch-github
      fd
      bottom
      ripgrep
      ripgrep-all
      ffmpeg
      ytfzf
      yt-dlp
      jq
      distrobox
      pup
      lazygit
      nitch

      libnotify
      tree
      lf
      invidtui
      noto-fonts
      (nerdfonts.override {
        fonts = [
          "DroidSansMono"
          "JetBrainsMono"
          "HeavyData"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;
  programs.bash.enable = true;
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.11";
}
