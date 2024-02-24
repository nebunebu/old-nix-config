{ inputs, ... }:
{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./css.nix
  ];
  # programs.browserpass.browsers = [ "firefox" ];
  programs.firefox = {
    enable = true;
    profiles.nebu = {
      isDefault = true;
      id = 0;
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        vimium
        i-dont-care-about-cookies
        reddit-enhancement-suite
        old-reddit-redirect
      ];

    };
    profiles.noogle = {
      id = 1;
      settings = {
        "browser.startup.homepage" = "https://noogle.dev";
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        vimium
      ];
    };
    profiles.nixpkgs = {
      id = 2;
      settings = {
        "browser.startup.homepage" = "https://search.nixos.org/packages";
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        vimium
      ];
    };
    profiles.hm-options = {
      id = 3;
      settings = {
        "browser.startup.homepage" = "https://mipmip.github.io/home-manager-option-search";
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        vimium
      ];
    };
    profiles.lichess = {
      id = 4;
      settings = {
        "browser.startup.homepage" = "https://lichess.org/training";
      };
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        vimium
      ];
    };
  };
}
