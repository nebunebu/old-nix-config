{ pkgs, ...}:
let
  gen-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "gen-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "David-Kunz";
      repo = "gen.nvim";
      rev = "41ad952";
      sha256 = "sha256-cNz/yPTTgt1ng4C2BqN4P62FBV7lmDIEmEsdDhfyKHk=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      { plugin = rose-pine; config = "colorscheme rose-pine"; }
      firenvim
      gen-nvim
      telescope-ui-select-nvim
    ];

    extraConfigLua = ''
      require('gen').setup({
        model = "mistral",
        display_mode = "float",
        show_prompt = true,
        show_model = true,
        no_auto_close = true,
        init = nil,
        command = "curl --silent --no-buffer -X POST http://172.17.02:11434/api/generate -d $body"
      })

      require('gen').prompts['Elaborate_Text'] = {
        prompt = "Elaborate the following text:\n$text",
      }
      require('gen').prompts['Fix_Code'] = {
        prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
        replace = true,
        extract = "```$filetype\n(.-)```"
      }

-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")


    '';

  };
}
