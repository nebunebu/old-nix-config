{
  pkgs,
  outputs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.newsraft
  ];
  programs.newsraft = {
    enable = true;
    package = pkgs.unstable.newsraft;
    config = ''
      bind b exec xdg-open "%l"
    '';
    feeds = ''
      https://www.youtube.com/feeds/videos.xml?channel_id=UCTUYHL3XgAYmVChdlK_vnVQ "Comedy Enforement"
      https://dotfyle.com/this-week-in-neovim/rss.xml "This Week in Neovim"
    '';
  };
}
