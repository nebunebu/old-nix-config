# Hm module for https://github.com/swindlesmccoop/BlOgTeX
{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs.blogtex;
in {
  options = {
    programs.blogtex = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Whether to enable blogtex
        '';
      };
      pandoc = lib.mkOption {
        type = lib.types.package;
        default = pkgs.pandoc;
        description = ''
          Pandoc version to use
        '';
      };
      tex-dir = lib.mkOption {
        type = lib.types.path;
        default = ~/blogtex/tex;
        description = ''
          Path to directory that stores your tex files
        '';
      };
      html-dir = lib.mkOption {
        type = lib.types.path;
        default = ~/blogtex/tex;
        description = ''
          Path to directory that stores your tex files
        '';
      };
      styles = lib.mkOption {
        type = lib.types.path;
        default = ~/blogtex/tex;
        description = ''
          Path to directory that stores your tex files
        '';
      };
      blog-url = lib.mkOption {
        type = lib.types.path;
        default = ~/blogtex/tex;
        description = ''
          Path to directory that stores your tex files
        '';
      };
    };
  };

  config = {
    config = lib.mkIf cfg.enable {
      home.packages = [config.pandoc];
      home.file = {
      };
    };
  };
}
