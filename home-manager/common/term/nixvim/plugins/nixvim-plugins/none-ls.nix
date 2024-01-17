{
  programs.nixvim.plugins.none-ls = {
    enable = false;
    # diagnosticConfig = ;
    # diagnosticFormat = ;
    sources = {
      code_actions = { 
        eslint.enable = true;
        gitsigns.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        cppcheck.enable = true;
        deadnix.enable = true;
        eslint.enable = true;
        luacheck = {
          enable = true;
        };
        # markdownlint.enable = true;
        pylint.enable = true;
        shellcheck.enable = true;
        statix.enable = true;
      };
      formatting = {
        alejandra.enable = true;
        beautysh.enable = true;
        fourmolu.enable = true;
        jq.enable = true;
        nixpkgs_fmt.enable = true;
        stylua.enable = true;
      };
    };
  };
}
