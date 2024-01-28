{
  pkgs,
  vimUtils,
  ...
}:
vimUtils.buildVimPlugin {
  pname = "triptych.nvim";
  version = "2023-01-21";
  src = pkgs.fetchFromGitHub {
    owner = "simonmclean";
    repo = "triptych.nvim";
    rev = "10yrfkxrb5kvlspw2vklqpsxvrrnzp4zhabv7p96kdjqvi009gwk";
    sha256 = "sha256-xXk+lsznwoRJo6YPxP8aAgswzJpK7K+h7e9e4rF32aE=";
  };
  meta.homepage = "https://github.com/simonmclean/triptych.nvim";
}
