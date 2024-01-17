{
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;
      nvim-cmp = {
        enable = true;
        snippet.expand = "luasnip";
        completion.keywordLength = 2;
        window = {
          completion.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          documentation.border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;
      cmp_luasnip.enable = true;

      # cmp-buffer
      # cmp-calc
      # cmp-clippy
      # cmp-cmdline
      # cmp-cmdline-history
      # cmp-conventionalcommits
      # cmp-dap
      # cmp-dictionary
      # cmp-digraphs
      # cmp-emoji
      # cmp-fish
      # cmp-fuzzy-buffer
      # cmp-fuzzy-path
      # cmp-git
      # cmp-greek
      # cmp-latex-symbols
      # cmp-look
      # cmp-npm
      # cmp-nvim-lsp
      # cmp-nvim-lsp-document-symbol
      # cmp-nvim-lsp-signature-help
      # cmp-nvim-lua
      # cmp-nvim-ultisnips
      # cmp-omni
      # cmp-pandoc-nvim
      # cmp-pandoc-references
      # cmp-path
      # cmp-rg
      # cmp-snippy
      # cmp-spell
      # cmp-tabnine
      # cmp-tmux
      # cmp-treesitter
      # cmp-zsh
      # cmp_luasnip
    };

    extraConfigLua = /* lua */ ''
      has_words_before = function()
        unpack = unpack or table.unpack
        line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      luasnip = require("luasnip")
      local cmp = require("cmp")

      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_locally_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },

        sources = cmp.config.sources({
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'treesitter' }
        }),

      })

      cmp.setup.filetype('tex', {
        sources = cmp.config.sources({
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'treesitter' },
          { name = 'latex_symbols' }
        })
      })


      cmp.setup.filetype('lua', {
        sources = cmp.config.sources({
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'treesitter' },
          { name = 'nvim_lua' }
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    '';
  };
}
