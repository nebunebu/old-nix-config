{
  programs.nixvim.plugins.alpha = {
    enable = true;
    iconsEnabled = true;
    layout = [
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Type";
          position = "center";
        };
        type = "text";
        val = [
          "  ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗  "
          "  ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║  "
          "  ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║  "
          "  ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║  "
          "  ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║  "
          "  ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  "
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            command = "<CMD>ene <CR>";
            desc = "  New file";
            shortcut = "e";
          }
          {
            command = "<CMD>e $HOME/.wiki/index.md<CR>";
            desc = "  Wiki";
            shortcut = "w";
          }
          {
            command = "<CMD>e $HOME/.config/home-manager/common/default.nix<CR>";
            desc = "󱎰  Home-manager";
            shortcut = "h";
          }
          {
            command = "<CMD>e $HOME/.config/home-manager/common/programs/cli/default.nix<CR>";
            desc = "  CLI Programs";
            shortcut = "c";
          }
          {
            command = "<CMD>e $HOME/.config/home-manager/common/programs/tui/default.nix<CR>";
            desc = "  TUI Programs";
            shortcut = "t";
          }
          {
            command = "<CMD>e $HOME/.config/home-manager/common/programs/gui/default.nix<CR>";
            desc = "  GUI Programs";
            shortcut = "g";
          }
          {
            command = "<CMD>e $HOME/.config/home-manager/common/programs/tui/nixvim/default.nix<CR>";
            desc = "  Nixvim";
            shortcut = "n";
          }
          {
            command = ":qa<CR>";
            desc = "󱎰  Quit Neovim";
            shortcut = "q";
          }
        ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "Keyword";
          position = "center";
        };
        type = "text";
        val = "Let scholastic sophisters entangle themselves in their own cobwebs";
      }
    ];
  };
}
