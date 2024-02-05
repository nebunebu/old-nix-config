{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs.blahg;
  src = "${cfg.directory}/src";
  dst = "${cfg.directory}/dst";
  tmp = "${cfg.directory}/tmp";
  xml = "${src}/partials/header.xml";
  html = "${src}/partials/header.html";
in {
  options = {
    programs.blahg = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Whether to enable blog
        '';
      };

      pandoc = lib.mkOption {
        type = lib.types.package;
        default = pkgs.pandoc;
        description = ''
          Pandoc version to use
        '';
      };

      directory = lib.mkOption {
        type = lib.types.path;
        default = "${config.home.homeDirectory}/blahg";
        description = ''
          Directory where your blog will be placed
        '';
      };

      title = lib.mkOption {
        type = lib.types.str;
        default = "My Blog";
        description = ''
          The title of your blog
        '';
      };

      description = lib.mkOption {
        type = lib.types.str;
        default = "The Subtitle of My Blog";
        description = ''
          Functionally the subtitle of your blog
        '';
      };

      url = lib.mkOption {
        type = lib.types.str;
        default = "http://example.com";
        description = ''
          The url of your blog
        '';
      };

      html-header = lib.mkOption {
        type = lib.types.lines;
        default =
          /*
          html
          */
          ''
            <!doctype html>
            <link rel="stylesheet" href="/css/main.css" />
            <title>${cfg.title}</title>

            <h1>${cfg.title}</h1>
            <p><i>${cfg.description}</i></p>
          '';
        description = ''
          Your html headers
        '';
      };
      xml-header = lib.mkOption {
        type = lib.types.lines;
        default =
          /*
          xml
          */
          ''
            <?xml version="1.0" encoding="utf-8"?>
            <?xml-stylesheet type="text/css" href="/css/main.css"?>
            <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">

            <channel>
            <title>${cfg.title}</title>
            <description>${cfg.description}</description>
            <language>en-us</language>
            <link>${cfg.url}/rss.xml</link>
            <atom:link href="${cfg.url}/rss.xml" rel="self" type="application/rss+xml" />
          '';
        description = ''
          Your xml headers
        '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.tmpfiles.rules = [
      # FIX: Don't hard code user
      "d ${cfg.directory} 755 nebu users - -"
      "d ${cfg.directory}/src 755 nebu users - -"
      "d ${cfg.directory}/dst 755 nebu users - -"
      "d ${cfg.directory}/src/partials 755 nebu users - -"
    ];

    home.file = {
      "${xml}".text = "${cfg.xml-header}";
      "${html}".text = "${cfg.html-header}";
    };

    home.packages = [
      (pkgs.writeShellApplication {
        name = "blahgc";
        runtimeInputs = [
          pkgs.cowsay
          pkgs.pandoc
        ];
        text =
          /*
          sh
          */
          ''
            cowsay blahgc

            rm -f ${dst}/*
            # grep -E "date{|title{" -m 3 ${src}/*.tex\
            #     | sed -e 's/^\\date//'\
            #     -e 's/:/ /'\
            #     -e 's/}//'\
            #     -e '/maketitle/d'\
            #     | paste - -\
            #     | sed -e 's/^/<a href="/'\
            #     | sed -e 's/\\title{/">/'\
            #     | sed -e 's/.*tex//2g'\
            #     | sed -e 's/\.tex/\.html/'\
            #     | awk '{for(i=NF;i>1;i--)printf "%s ",$i;printf "%s",$1;print ""}'\
            #     | sort -r -k1.7,1.10 -k1.1,1.2 -k1.4,1.5\
            #     | awk '{for(i=NF;i>1;i--)printf "%s ",$i;printf "%s",$1;print ""}'\
            #     > ${tmp}



            grep -E "date{|title{" -m 3 ${src}/*.tex \
            | sed -e 's/\\date{//; s/:/ /; s/}//; /maketitle/d' \
            | paste - - \
            | sed -e 's/^/<a href="/; s/\\title{/">/; s/.*tex//2g; s/\.tex/\.html/' \
            | awk '{for (i=1; i<=NF-2; i++) printf "%s ", $i; print $NF}' \
            | sed -e 's/\(.*\) /\1<\/a> - /; s/$/<br>/' \
            | awk '{for(i=NF;i>1;i--)printf "%s ",$i;printf "%s",$1;print ""}' \
            | sort -r -k1.7,1.10 -k1.1,1.2 -k1.4,1.5 \
            | awk '{for(i=NF;i>1;i--)printf "%s ",$i;printf "%s",$1;print ""}' \
            > ${tmp}

            cat ${html} ${tmp} > ${dst}/index.html
            rm ${tmp}
            cp ${xml} ${dst}/rss.xml

            _texgrep() {
              grep -m 1 "$1" "$2" | grep -o "{.*}"\
              | sed -e 's/{//; s/}//' ;
            }

            # _getdated() {
            #   grep -o '<a href=".* ">' ${dst}/index.html\
            #   | sed -e 's/<a href="//; s/\.html ">//' ;
            # }

            DATED="$(grep -o '<a href=".*">' ${dst}/index.html | sed -e 's/<a href="//; s/\.html ">//')"
            for f in $DATED; do
            # NOTE: add flag for equation rendering
            # --webtex="https://latex.codecogs.com/svg.latex?"
            pandoc "$f".tex -f latex -t html -s -o ${dst}/"$f".html

            printf "
              <item>
              <title>%s</title>
              <guid>${cfg.url}/$f.html</guid>
              <pubDate>%s</pubDate>
              <description><![CDATA[
              $(sed -e 's/%/%%/g; /<h1 class="title">/d; /<p class="date">/d' ${dst}/"$f".html)
              ]]></description>
              </item>
              " "$(_texgrep "title{" "$f".tex)"\ "$(_texgrep "date{" "$f".tex)" >> ${dst}/rss.xml

            done
          '';
      })
    ];
  };
}
