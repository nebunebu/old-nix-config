{
  programs.firefox.profiles.nebu.bookmarks = [
    {
      name = "wikipedia";
      tags = ["wiki"];
      keyword = "wiki";
      url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
    }
    {
      name = "kernel.org";
      url = "https://www.kernel.org";
    }
    {
      name = "Nix sites";
      toolbar = true;
      bookmarks = [
        {
          name = "homepage";
          url = "https://nixos.org/";
        }
        {
          name = "wiki";
          tags = ["wiki" "nix"];
          url = "https://nixos.wiki/";
        }
      ];
    }
  ];
}
