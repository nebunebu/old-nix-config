{ pkgs
, config
, lib
, ...
}:
let
  cfg = config.programs.blogtex;
in
{
  options.programs.blogtex = {
    enable = lib.mkEnableOption "blogtex tool";
    pandoc = lib.mkOption {
      type = lib.types.package;
      default = pkgs.pandoc;
      description = "Package providing {command} `pandoc`.";
    };
    title = lib.mkOption { };
    description = lib.mkOption { };
    url = lib.mkOption { };
    src = lib.mkOption { };
    dst = lib.mkOption { };
  };

  config = { };
}
