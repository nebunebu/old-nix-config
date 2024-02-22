{ config
, lib
, pkgs
, ...
}:
with lib; let
  cfg = config.programs.newsraft;
in
{
  options = {
    programs.newsraft = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = ''
          Whether to enable newsraft
        '';
      };
      package = mkOption {
        type = types.package;
        default = pkgs.newsraft;
        description = "The newsraft package to use";
      };
      extraConfig = mkOption {
        type = types.lines;
        default = "";
        description = "Newsraft configuration";
      };
      feeds = mkOption {
        type = types.submodules {
          options = {
            section = mkOption {
              type = types.str;
              default = "";
              description = "Section Title";
              example = "Sports News";
            };
            update = mkOption {
              type = types.int;
              default = 0; # should be null or empty string
              description = "Section Update Timer";
              example = 15;
            };
            urls = mkOption.listOf (types.submodule {
              options = {
                feed = mkOption {
                  type = types.str;
                  default = "";
                  description = "Feed Title";
                  example = "Lorem Ipsum Blog";
                };
                url = mkOption {
                  type = types.str;
                  default = "";
                  description = "Feed URL";
                  example = "http://example.com";
                };
                update = mkOption {
                  type = types.int;
                  default = 0; # should be null or empty string
                  description = ''
                    Automatic Update Timer for Fee Url in Minutes
                    Takes Precedence over Section Update Timer
                  '';
                  example = 60;
                };
              };
            });
          };
        };
      };
      extraFeeds = mkOption {
        type = types.lines;
        default = "";
        description = "Newsraft feeds";
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];
    xdg.configFile."newsraft/config".text = cfg.extraConfig;
    xdg.configFile."newsraft/feeds" = mkIf (cfg.feeds != { }) { text = feedsFileContents; };
  };
}
