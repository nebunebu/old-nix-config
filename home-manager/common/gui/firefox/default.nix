{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./css.nix
  ];
  # programs.browserpass.browsers = [ "firefox" ];
  programs.firefox = {
    enable = true;
    # policies = {};
    profiles.nebu = {
      # extraConfig = '''';
      # search.engines = {};
      # settings = {};
    };
  };
}
