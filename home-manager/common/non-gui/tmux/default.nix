{ pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    prefix = "C-SPACE";
    keyMode = "vi";
    baseIndex = 1;
    disableConfirmationPrompt = true;
    mouse = true;
    newSession = true;
    sensibleOnTop = true;
    terminal = "xterm-kitty";
    extraConfig = ''
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
      set -g status-position top
      set -g status-interval 1
    ''
      + builtins.readFile ./keybinds.conf
      ;

    plugins = with pkgs.tmuxPlugins; [
      # (callPlugin ../../../../pkgs/tmuxPlugins/rose-pine.nix { })
      {
        plugin = mkTmuxPlugin {
          pluginName = "rose-pine";
          version = "unstable-2024-01-07";
          src = pkgs.fetchFromGitHub {
            owner = "rose-pine";
            repo = "tmux";
            rev = "dd6d01338ac4afeb96542dcf24e4a7fe179b69e6";
            sha256 = "sha256-Tccb4VjdotOSw7flJV4N0H4557NxRhXiCecZBPU9ICQ=";
          };
        rtpFilePath = "rose-pine.tmux";
        };
        extraConfig = ''
          set -g @rose_pine_variant 'main'
          set -g @rose_pine_date_time '%_I:%M %a %D'
          set -g @rose_pine_show_pane_directory 'on'
          set -g @rose_pine_status_left_prepend_section '#{tmux_mode_indicator}'
          set -g @rose_pine_show_current_program 'on'
          set -g @rose_pine_show_pane_directory 'on'
        '';
      }
      {
        plugin = mode-indicator;
        extraConfig = ''
          set -g @mode_indicator_prefix_prompt ' WAIT '
          set -g @mode_indicator_copy_prompt ' COPY '
          set -g @mode_indicator_sync_prompt ' SYNC '
          set -g @mode_indicator_empty_prompt ' TMUX '
          set -g @mode_indicator_prefix_mode_style 'bg=#191724,fg=blue'
          set -g @mode_indicator_copy_mode_style 'bg=#191724,fg=yellow'
          set -g @mode_indicator_sync_mode_style 'bg=#191724,fg=red'
          set -g @mode_indicator_empty_mode_style 'bg=#191724,fg=cyan'
        '';
      }
      {
        plugin = extrakto;
        extraConfig = ''
          set -g @extrakto_clip_tool wl-copy
          set -g @extrakto_editor nvim
          set -g @extrakto_open_tool firefox
          set -g @extrakto_filter_order 'url path line word'
        '';
      }
      sensible
      vim-tmux-navigator
      yank
    ];
  };
}
