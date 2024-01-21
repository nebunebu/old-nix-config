{ inputs, lib, pkgs, config, ... }:

{
  options = {
    wallpaper = lib.mkOption {
      default = ./Wallpaper1.png;
      type = lib.types.path;
      description = ''
        Path to your wallpaper
      '';
    };
  };
  config = {
    home.file."testscript.sh".source =
      let
        script = pkgs.writeShellScriptBin "testscript.sh" ''
          ${pkgs.swww}/bin/swww img -o DP-1 ${config.wallpaper}
        '';
      in
      "${script}/bin/testscript.sh";
  };
}
