{
  programs.firefox.profiles.nebu.bookmarks = [
    {
      name = "Nix sites";
      toolbar = true;
      bookmarks = [
        {
          name = "nixpkgs search";
          url = "https://search.nixos.org/packages";
        }
        {
          name = "noogle.dev";
          url = "https://noogle.dev";
        }
        {
          name = "nix.dev";
          url = "https://nix.dev";
        }
        {
          name = "Home Manager Options";
          url = "https://mipmip.github.io/home-manager-option-search/";
        }
        {
          name = "nixos.org";
          url = "https://nixos.org/";
        }
      ];
    }
  ];
}
