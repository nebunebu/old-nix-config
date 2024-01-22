{
  programs.nixvim.plugins.which-key.enable = true;
  programs.nixvim.extraConfigLua = /* lua */ ''
    require("which-key").setup({})
    local wk = require("which-key")

    wk.register({
      ["<leader>"] = {
        ["/"] = {
          "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
          "Toggle Line Comment"
        },
        h = {
          "<cmd>nohlsearch<CR>",
          "Clear Search Highlights"
        },
        t = {
          "<cmd>Triptych<CR>",
          "Open Triptych"
        },
        n = {
          "<cmd>NullLsInfo<CR>",
          "Open NullLsInfo"
        },
        u = {
          "<cmd>UndotreeToggle<CR>",
          "Open Undotree"
        },
        g = {
          ":Gen<CR>",
          "Open Gen"
        },

        ["f"] = {
          name = "Telescope",
          f =
          { "<cmd>Telescope find_files<CR>",
            "Find files"
          },
          o =
          { "<cmd>Telescope oldfiles<CR>",
            "Find old files"
          },
          m =
          { "<cmd>Telescope man_pages<CR>",
            "Find man pages"
          },
          c =
          { "<cmd>Telescope current_buffer_fuzzy_find<CR>",
            "Find in current buffer"
          },
          h =
          { "<cmd>Telescope help_tags<CR>",
            "Find help tags"
          },
        },
      },
    }, {mode = "n"})


    wk.register({
      ["<"] = {
        "<gv", "Dedent and keep selection"
      },
      [">"] = {
        ">gv", "Indent and keep selection"
      },
      ["<leader>"] = {
        ["/"] = {
          "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
          "Toggle Visual Comment"
        },
        g = {
          ":Gen<CR>",
          "Open Gen"
        },
      }
    }, { mode = "x" })
      '';
}
