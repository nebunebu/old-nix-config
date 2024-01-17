{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jellyfin-mpv-shim
  ];

  programs.mpv = {
    enable = true;
    bindings = {
      "j" = "seek -5";
      "k" = "cycle pause";
      "l" = "seek 5";
      "<" = "frame-back-step";
      ">" = "frame-step";
      # "c" = "script-message-to crop start-crop soft";
      # "C" = "script-message-to crop start-crop hard";
    };
    config = {
      osc = "no";
      osd-level = 0;
      border = "no";
      watch-later-directory = "~/.config/mpv/watch_later/";
    };
    scriptOpts = {
      # osc = {
      #   visibility = "auto";
      #   boxalpha = 255;
      #   osc_color = "000000";
      #   seekbarfg_color = "c4a7e7";
      #   seekbarbg_color = "6e6a86";
      #   showonseek = false;
      #   showonstart = false;
      #   showonpause = false;
      #   titlefont = "ShureTechMono Nerd Font";
      # };
      webm = {
        output_directory = "~/Media/Clips/";
        output_format = "mp4";
        output_template = "%F-%S-%E";
        twopass = "no";
      };
    };
    scripts = with pkgs.mpvScripts; [
      thumbfast
      mpv-webm
      sponsorblock
    ];
  };
}
