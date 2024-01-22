{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./core/globals.nix
    ./core/options.nix
#   ./core/autoCmd.nix
#   ./core/customFunctions.nix
#   ./core/highlight.nix
#   ./core/autoGroups.nix
#   ./core/userCommands.nix
#   ./core/filetype.nim
    ./plugins/default.nix
  ];

  programs.nixvim = {
    enable = true;
    clipboard.providers.wl-copy.enable = true;
  };
}
