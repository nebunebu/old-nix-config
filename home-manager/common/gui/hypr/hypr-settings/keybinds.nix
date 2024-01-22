{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    binde = [
      ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%-"
      ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
    ];

    bind = [
      "$mainMod, INSERT, exec, power-menu"
      ",XF86KbdBrightnessDown, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"

      "$mainMod, ALT_R, exec, screen-capture"

      "$mainMod, X, killactive"
      "$mainMod, M, fullscreen, 1"
      "$mainMod, F, togglefloating"
      "$mainMod, V, exec, cliphist-menu"

      "$mainMod, Return, exec, kitty zsh -c \"tmux new-session -A -s \"main\"\""
      "$mainMod, I, exec, firefox"
      "$mainMod, P, exec, fuzzel"
      "$mainMod, D, exec, distrobox enter arch -- discord-screenaudio"
      "$mainMod, U, exec, waydroid app launch com.android.deskclock"

      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
    ];
  };
}
