pkgs: {
  # spotube = pkgs.callPackage ./spotube.nix {};
  # newsraft-latest = pkgs.callPackage ./newsraft.nix {};
  invidtui = pkgs.callPackage ./invidtui.nix {};
  rose-pine = pkgs.callPackage ./tmuxPlugins/rose-pine.nix {};
  triptych-nvim = pkgs.callPackage ./vimPlugins/triptych-nvim.nix {};
}
