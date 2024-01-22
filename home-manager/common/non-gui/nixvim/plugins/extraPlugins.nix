{ pkgs, ...}:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      { plugin = rose-pine; config = "colorscheme rose-pine"; }
      firenvim
    ];
  };
}
