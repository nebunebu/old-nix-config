{ config, ... }:

{
  imports = [
    ./scripts/default.nix
  ];
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "DroidSansM Nerd Font";
        prompt = "󰁔";
        dpi-aware = "auto";
        fuzzy = "yes";
        inner-pad = 10;
        icons-enabled = "no";
        layer = "top";
        exit-on-keyboard-focus-loss = "yes";
      };
      dmenu.mode = "text";
        border = {
          width = 2;
          radius = 10;
        };
      colors = {
        background = "${config.colorScheme.colors.base00}ff";
        text = "${config.colorScheme.colors.base05}ff";
        match = "${config.colorScheme.colors.base0B}ff";
        selection = "${config.colorScheme.colors.base0B}ff";
        selection-text = "${config.colorScheme.colors.base00}ff";
        selection-match = "${config.colorScheme.colors.base0E}ff";
        border = "${config.colorScheme.colors.base0D}ff";
      };
    };
  };
}
