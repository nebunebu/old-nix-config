{ inputs, ... }:

{
  programs.firefox.profiles.nebu.extensions =
  with inputs.firefox-addons.packages."x86_64-linux"; [
    ublock-origin
    vimium
    i-dont-care-about-cookies
    bukubrow
    enhanced-github
    reddit-enhancement-suite
    old-reddit-redirect
    # view-image
    # search-by-image
    # sourcegraph
    # sponsorlock
    # video-downloadhelper
    # tampermonkey
    # redirector
    # hls-stream-detector
    # dictionaries
    # ff2mpv
    # firenvim
    # greasemonkey
    # clearurls
    # browserpass
    # aria2-integrations
  ];
}
