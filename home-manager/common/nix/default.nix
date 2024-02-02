{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      nix-output-monitor
      alejandra
      nurl
      comma
      statix
      nix-search-cli
      nix-prefetch-github
      ;
  };
}
