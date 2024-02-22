{ config
, pkgs
, ...
}:
let
  nbxmls = "${config.xdg.configHome}/newsboat/xmls";
in
{
  imports = [
    ./full-yt/default.nix
  ];

  systemd.user.services.newsboat-init = {
    Install.WantedBy = [ "default.target" ];
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.writeShellScript "url-sub" ''
        ${pkgs.coreutils}/bin/cat "hello" >> /home/nebu/.config/newsboat/urls
      ''}";
    };
  };

  programs.newsboat = {
    urls = [
      # {
      #   title = "${config.sops.secrets.twitch.path}";
      #   url = "lol";
      # }
      {
        tags = [ "neovim" "articles" ];
        title = "This Week in Neovim";
        url = "https://dotfyle.com/this-week-in-neovim/rss.xml ";
      }
      {
        tags = [ "articles" ];
        title = "lifehaker";
        url = "https://lifehacker.com/feed/rss";
      }
      {
        tags = [ "articles" ];
        title = "longreads";
        url = "https://longreads.com/feed/";
      }
      {
        tags = [ "yt" ];
        title = "typecraft";
        url = "https://www.scriptbarrel.com/xml.cgi?channel_id=UCo71RUe6DX4w-Vd47rFLXPg";
      }
      {
        tags = [ "articles" ];
        title = "aeon";
        url = "https://aeon.co/feed.rss";
      }
      {
        tags = [ "articles" ];
        title = "mental floss";
        url = "https://www.mentalfloss.com/rss.xml";
      }
      {
        tags = [ "articles" ];
        title = "openculture";
        url = "https://www.openculture.com/feed/rss2";
      }
      {
        tags = [ "yt" "nix" ];
        title = "Vimjoyer";
        url = "https://www.scriptbarrel.com/xml.cgi?channel_id=UC_zBdZ0_H_jn41FDRG7q4Tw";
      }
      # {
      #   tags = [ "podcasts" ];
      #   title = "redbar";
      #   url = "https://redbarradio.net/feed/rbr";
      # }
      # {
      #   tags = [ "yt" "chess" ];
      #   title = "Ben S Chess";
      #   url = "https://www.scriptbarrel.com/xml.cgi?channel_id=UCzGoTD4RMsbUJCQcnWs0DRw";
      # }
      {
        tags = [ "yt" "nix" ];
        title = "IogaMaster";
        url = "https://www.scriptbarrel.com/xml.cgi?channel_id=UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        tags = [ "yt" "nix" ];
        title = "RubberDuck";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs_xdqtQHTkl7LxazKIjKCg";
      }
      {
        tags = [ "yt" "philosophy" ];
        title = "Friction";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC0qBGtdt2WwEmlMQnxWxCJw";
      }
      {
        tags = [ "yt" "linux" ];
        title = "Eric Murphy";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC5KDiSAFxrDWhmysBcNqtMA";
      }
      {
        tags = [ "yt" "linux" ];
        title = "DistroTube";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg";
      }
      {
        tags = [ "yt" "linux" ];
        title = "DistroTube Full";
        url = "file://${nbxmls}/UCVls1GmFKf6WlTraIb_IaJg.xml";
      }
      {
        tags = [ "yt" ];
        title = "Vsauce";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC6nSFpj9HTCZ5t-N3Rm3-HA";
      }
      {
        tags = [ "yt" ];
        title = "Kane B";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGVHC4L6gjS13AMe-JMOjHg";
      }
      {
        tags = [ "yt" "history" ];
        title = "The Pharaoh Nerd";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCGX1QMBfoq-vYQTr8MUCDqA";
      }
      {
        tags = [ "yt" "history" ];
        title = "TREY the Explainer";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCOuWeOkMrq84u5LY6apWQ8Q";
      }
      {
        tags = [ "yt" "history" ];
        title = "Stefan Milo";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCZ9jWH_8tJ-Nmaj8dSQdEYA";
      }
      {
        tags = [ "yt" "philosophy" ];
        title = "Jeffrey Kaplan";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UC_hukbByJP7OZ3Xm2tszacQ";
      }
      {
        tags = [ "yt" "neovim" ];
        title = "TJ DeVries";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCd3dNckv1Za2coSaHGHl5aA";
      }
      {
        tags = [ "yt" "neovim" "ythist" ];
        title = "TJ DeVries full";
        url = "file://${nbxmls}/UCd3dNckv1Za2coSaHGHl5aA.xml";
      }
      {
        tags = [ "yt" "linux" "shell" ];
        title = "Kris Occhipinti";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCf93fPKwotph47H3_KDcRyg";
      }
      {
        tags = [ "yt" "history" "linguistics" ];
        title = "Simon Roper";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UChnRk6mxWsSOGElm8phdSxw";
      }
      {
        tags = [ "yt" "linux" ];
        title = "Brodie Robertson";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA";
      }
      {
        tags = [ "yt" "linux" ];
        title = "BugsWriter";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCngn7SVujlvskHRvRKc1cTw";
      }
      {
        tags = [ "yt" "cs" ];
        title = "Fireship";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA";
      }
      {
        tags = [ "yt" "linux" ];
        title = "Learn Linux TV";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCxQKHvKbmSzGMvUrVtJYnUA";
      }
    ];
  };
}
