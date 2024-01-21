{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jellyfin-mpv-shim
  ];

  home.file = {
    # ".config/mpv/scripts/modernx.lua".source = ./scripts/osc/modernx.lua;
    # ".config/mpv/fonts/modernx-osc-icon.ttf".source = ./scripts/osc/modernx-osc-icon.ttf;
    # ".config/mpv/scripts/crop.lua".source = ./scripts/crop.lua;
    # ".config/mpv/scripts/auto-save-state.lua".source = ./scripts/auto-save-state.lua;
    # ".config/mpv/scripts/locatefile.lua".source = ./scripts/locatefile.lua;
    # ".config/mpv/script-modules/extended-menu.lua".source = ./scripts/extended-menu.lua;
    # ".config/mpv/scripts/M-x.lua".source = ./M-x.lua;
    # not sure if working or keeping
    # ".config/mpv/scripts/command_palette.lua".source = ./command_palette.lua;
    # ".config/mpv/scripts/auto_mode.lua".source = ./auto_mode.lua;
    # ".config/mpv/scripts/gallery-dl_hook.lua".source = ./gallery-dl_hook.lua;
    # ".config/mpv/scripts/show_chapters.lua".source = ./show_chapters.lua;
  };

  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      # (pkgs.callPackage ../../../../pkgs/mpvScripts/auto-save-state.nix { })
      thumbfast
      mpv-webm
      # pkgs.unstable.mpvScripts.sponsorblock-minimal
    ];

    bindings = {
      "j" = "seek -5";
      "k" = "cycle pause";
      "l" = "seek 5";
      "<" = "frame-back-step";
      ">" = "frame-step";
      "c" = "script-message-to crop start-crop soft";
      "C" = "script-message-to crop start-crop hard";
      # "Alt+l" = "script_message locate-current-file";
      # ":" = "script-binding seek-to";
      # "f" = "script-binding quality-menu/video_formats_toggle";
      # "Alt+b" = "script_message-to command_palette show-command-palette bindings";
      # "Alt+c" = "script_message-to command_palette show-command-palette commands";
      # "Alt+p" = "script_message-to command_palette show-command-palette properties";
      # "Alt+o" = "script_message-to command_palette show-command-palette options";
    };
    config = {
      osc = "no";
      osd-level = 0;
      border = "no";
      watch-later-directory = "~/.config/mpv/watch_later/";
    };
    scriptOpts = {
      osc = {
        visibility = "auto";
        boxalpha = 255;
        osc_color = "000000";
        seekbarfg_color = "c4a7e7";
        seekbarbg_color = "6e6a86";
        showonseek = false;
        showonstart = false;
        showonpause = false;
        titlefont = "ShureTechMono Nerd Font";
      };
      webm = {
        output_directory = "~/Media/Clips/";
        output_format = "mp4";
        output_template = "%F-%S-%E";
        twopass = "no";
      };
    };
  };
}
