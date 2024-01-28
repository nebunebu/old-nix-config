{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit
      (pkgs)
      alejandra
      nurl
      comma
      statix
      nix-search-cli
      nix-prefetch-github
      ;
  };
}
