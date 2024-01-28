{pkgs, ...}:
# Script for newsboat
# https://redbarradio.net/embed/vod2?id=REDBAR-SYMPOSIUM-2023/
# @steventheslimyjewboi The "embed code" for "REDBAR S21 E14" is different than usual, because it's a "DVR" recorded version /embed/dvr/ or /embed/dvr?id=REDBAR-S21-E14/
# You can use either https://redbarradio.net/embed/dvr/ or https://redbarradio.net/embed/dvr?id=REDBAR-S21-E14/
# Run episdoe name with vod through
# ./redbar "https"
# yt-dlp --downloader ffmpeg --hls-use-mpegts "<url>"
{
  home.packages = [
    (pkgs.writeShellScriptBin "redbar-dl" ''
      #!/run/current-system/sw/bin/bash
      url=$(curl "$1" | grep m3u8 | sed 's/<source src=//' | sed 's/ type.*$//')
      echo $url
    '')
  ];
}
