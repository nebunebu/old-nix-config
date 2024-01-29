{pkgs, ...}:
# let
#   newsraft = pkgs.newsraft.overrideAttrs (oldAttrs: {
#     inherit (oldAttrs) name;
#     version = "0.23";
#     src = pkgs.fetchFromGitea {
#       domain = "codeberg.org";
#       owner = "newsraft";
#       repo = "newsraft";
#       rev = "7d3676057a51d1e15de8c1a3064dce9efd0461ae";
#       sha256 = "sha256-c5yN67FL4siPyO8v0RuTCznwrqX9+r8tY5PKS4zlqIc=";
#     };
#   });
# in {
{
  home = {
    packages = [
      pkgs.newsraft-latest
    ];
  };
}
