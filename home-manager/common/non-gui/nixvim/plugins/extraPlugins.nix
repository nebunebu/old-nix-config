{pkgs, ...}: {
  programs.nixvim = {
    extraPlugins = [
      {plugin = pkgs.triptych-nvim;}
      {plugin = pkgs.vimPlugins.firenvim;}
      {
        plugin = pkgs.vimPlugins.rose-pine;
        config = "colorscheme rose-pine";
      }
      {
        plugin = pkgs.vimPlugins.glow-nvim;
      }
    ];
    extraConfigLua = ''
      require("triptych").setup({})

      require('glow').setup({
        glow_path = "${pkgs.glow}/bin/glow",
      })
    '';
  };
}
# -- glow_path = "${pkgs}",
