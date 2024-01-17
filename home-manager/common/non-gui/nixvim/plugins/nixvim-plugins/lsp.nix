{
  programs.nixvim.plugins = {
    lspkind = {
      enable = true;
      cmp.enable = true;
      mode = "symbol_text";
    };
    lsp = {
      enable = true;
      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      servers = {
        # ansiblels.enable = true;
        # astro.enable = true;
        bashls.enable = true;
        ccls.enable = true;
        cmake.enable = true;
        cssls.enable = true;
        # dockerls.enable = true;
        # elixirls.enable = true;
        # elmls.enable = true;
        # emmet_ls.enable = true;
        # eslint.enable = true;
        # gopls.enable = true;
        hls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        # leanls.enable = true;
        # ltex.enable = true;
        lua-ls.enable = true;
        nil_ls.enable = true;
        # nixd.enable = true;
        # perlpls.enable = true;
        pyright.enable = true;
        rnix-lsp.enable = true;
        # rust-analyzer.enable = true;
        # tailwindcss.enable = true;
        taplo.enable = true;
        # texlab.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;
      };
    };
  };
}
