{config, ...}: {
  xdg.configFile."ytfzf/conf.sh".text =
    /*
    sh
    */
    # NOTE: ytfzf is not using configured mpv instance
    ''
      video_player="${config.programs.mpv.finalPackage}/bin/mpv"
    '';
}
