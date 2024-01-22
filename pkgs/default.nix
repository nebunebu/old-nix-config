pkgs: {
  rose-pine = pkgs.callPackage ./tmuxPlugins/rose-pine.nix { };
  triptych-nvim = pkgs.callPackage ./vimPlugins/triptych-nvim.nix { };
  auto-save-state = pkgs.callPackage ./vimPlugins/auto-save-state.nix { };
}
