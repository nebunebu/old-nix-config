{
  pkgs,
  config,
  ...
}: {
  programs = {
    starship.enable = true;
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableVteIntegration = true;
      dotDir = ".config/zsh";
      loginExtra =
        /*
        bash
        */
        ''
          # if [ "$(tty)" = "/dev/tty1" ]; then
          #   exec Hyprland
          # fi
        '';

      # localVariables = {
      #   CLIPBOARD = "wlp";
      # };
      initExtra =
        builtins.readFile ./zsh-fzf-kill.zsh
        # + builtins.readFile ./zsh-clipboard.zsh
        # + builtins.readFile ./zsh-starship-fix.zsh
        ;

      history = {
        path = "${config.xdg.configHome}/zsh/zsh_history";
      };

      shellAliases = {
        svim = "sudo -Es nvim";
        grep = "grep --color=\"auto\"";
        ip = "ip --color=\"auto\"";
        tadd = "task add +capture";
        ol = "docker exec -it ollama ollama";
      };

      plugins = [
        # {
        #   name = "zsh-system-clipboard";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "kutsan";
        #     repo = "zsh-system-clipboard";
        #     rev = "v0.8.0";
        #     sha256 = "sha256-VWTEJGudlQlNwLOUfpo0fvh0MyA2DqV+aieNPx/WzSI=";
        #   };
        # }
        {
          name = "zsh-autopair";
          src = pkgs.fetchFromGitHub {
            owner = "hlissner";
            repo = "zsh-autopair";
            rev = "v1.0";
            sha256 = "wd/6x2p5QOSFqWYgQ1BTYBUGNR06Pr2viGjV/JqoG8A=";
          };
        }
        {
          name = "fzf-tab";
          src = pkgs.fetchFromGitHub {
            owner = "Aloxaf";
            repo = "fzf-tab";
            rev = "HEAD";
            sha256 = "sha256-gvZp8P3quOtcy1Xtt1LAW1cfZ/zCtnAmnWqcwrKel6w=";
          };
        }
        {
          name = "zsh-completions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-completions";
            rev = "0.35.0";
            sha256 = "sha256-GFHlZjIHUWwyeVoCpszgn4AmLPSSE8UVNfRmisnhkpg=";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "0.7.1";
            sha256 = "sha256-gOG0NLlaJfotJfs+SUhGgLTNOnGLjoqnUp54V9aFJg8=";
          };
        }
        {
          name = "zsh-vi-mode";
          src = pkgs.fetchFromGitHub {
            owner = "jeffreytse";
            repo = "zsh-vi-mode";
            rev = "v0.11.0";
            sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
          };
        }
        {
          name = "zsh-fzf-kill";
          src = pkgs.fetchFromGitHub {
            owner = "gessen";
            repo = "zsh-fzf-kill";
            rev = "HEAD";
            sha256 = "sha256-xbchXJTFWeABTwq6h4KWLh+EvydDrDzcY9AQVK65RS8=";
          };
        }
        # {
        #   name = "zsh-nix-shell";
        #   file = "nix-shell.plugin.zsh";
        #   src = pkgs.fetchFromGitHub {
        #     owner = "chisui";
        #     repo = "zsh-nix-shell";
        #     rev = "v0.7.0";
        #     sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
        #   };
        # }
      ];
    };
  };
}
