{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      {plugin = pkgs.triptych-nvim;}
      {plugin = pkgs.vimPlugins.firenvim;}
      {
        plugin = pkgs.vimPlugins.rose-pine;
        config = "colorscheme rose-pine";
      }
    ];
    extraConfigLua = ''
      require("triptych").setup({})
    '';
  };
}
