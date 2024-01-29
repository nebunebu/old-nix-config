pkgs: {
  rose-pine = pkgs.callPackage ./tmuxPlugins/rose-pine.nix {};
  triptych-nvim = pkgs.callPackage ./vimPlugins/triptych-nvim.nix {};
  spotube = pkgs.callPackage ./spotube.nix {};
  newsraft-latest = pkgs.callPackage ./newsraft.nix {};
}
