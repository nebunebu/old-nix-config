{
  home.file = {
    ".config/swaync/configSchema.json".source = ./configSchema.json;
    ".config/swaync/config.json" = {
      source = ./config.json;
      # onChange = "swaync-client -R";
    };
    ".config/swaync/style.css" = {
      source = ./style.css;
      # onChange = "swaync-client -rs";
    };
  };
}
