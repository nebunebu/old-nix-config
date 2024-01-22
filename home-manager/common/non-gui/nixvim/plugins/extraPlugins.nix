{ pkgs, ...}:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      { plugin = rose-pine; config = "colorscheme rose-pine"; }
      firenvim
      pkgs.triptych-nvim
    ];
    extraConfigLua = ''
      require("triptych").setup({})
    '';
    
  };
}
