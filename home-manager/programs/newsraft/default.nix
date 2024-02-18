{pkgs, ...}: {
  home.packages = [
    pkgs.unstable.newsraft
  ];

  xdg.configFile = {
    "newsraft/feeds".text = ''
      # $(cat ~/local-feed.xml) "local xml"
      @ General (yt) [720]
      https://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA "Veritasium"
      https://www.youtube.com/feeds/videos.xml?channel_id=UCTUYHL3XgAYmVChdlK_vnVQ "Comedy Enforecment"

      @ Philosophy (yt) [720]
      # "Majesty of Reason"
      # "Kane B"
      # "Attic Philosophy"
      https://www.youtube.com/feeds/videos.xml?channel_id=UC0qBGtdt2WwEmlMQnxWxCJw "Friction"

      @ Tech (yt) [720]
      https://www.youtube.com/feeds/videos.xml?channel_id=UCo71RUe6DX4w-Vd47rFLXPg "typecraft"
      https://www.youtube.com/feeds/videos.xml?channel_id=UCBq5p-xOla8xhnrbhu8AIAg "Tech Over Tea"
      https://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA "Luke Smith"

      @ Chess (yt) [720]
      https://www.youtube.com/feeds/videos.xml?channel_id=UCHP9CdeguNUI-_nBv_UXBhw "Daniel Naroditsky"

      @ History, Geography, Linguistics (yt) [720]
      https://www.youtube.com/feeds/videos.xml?channel_id=UCZ9jWH_8tJ-Nmaj8dSQdEYA "Stefan Milo"
    '';
    "newsraft/config".text = ''
    bind m exec mpv "%l"
    '';
  };
}
