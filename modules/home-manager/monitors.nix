{
  lib,
  config,
  ...
}: {
  options.monitors = lib.mkOption {
    type = lib.types.listOf (lib.types.submodule {
      options = {
        name = lib.mkOption {
          type = lib.types.str;
          example = "DP-1";
        };
        width = lib.mkOption {
          type = lib.types.init;
          example = 1920;
        };
        height = lib.mkOption {
          type = lib.types.init;
          example = 1080;
        };
        refreshRate = lib.mkOption {
          type = lib.types.init;
          example = 60;
        };
        x = lib.mkOption {
          type = lib.types.init;
          example = 0;
        };
        y = lib.mkOption {
          type = lib.types.init;
          example = 0;
        };
        enabled = lib.mkOption {
          type = lib.types.bool;
          example = true;
        };
      };
    });
    default = [];
  };

  # NOTE: example of option use
  # monitors = [
  #   {
  #     name = "DP-1";
  #     width = 1920;
  #     hieght = 1080;
  #     refreshRate = 60;
  #     x = 0;
  #     y = 0;
  #     enabled = true;
  #   }
  #   {
  #     name = "HDMI";
  #     width = 1920;
  #   }
  # ];
}
