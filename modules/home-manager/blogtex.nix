# Hm module for https://github.com/swindlesmccoop/BlOgTeX
{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.programs.blogtex;
in {
  options = {
    programs.blogtex = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = ''
          Whether to enable blogtex
        '';
      };

      pandoc = lib.mkOption {
        type = lib.types.package;
        default = pkgs.pandoc;
        description = ''
          Pandoc version to use
        '';
      };

      title = lib.mkOption {
        type = lib.types.str;
        default = "My Blog";
        description = ''
          The title of your blog
        '';
      };

      subtitle = lib.mkOption {
        type = lib.types.str;
        default = "The Subtitle of My Blog";
        description = ''
          The subtitle of your blog
        '';
      };

      url = lib.mkOption {
        type = lib.types.str;
        default = "http://example.com";
        description = ''
          The url of your blog
        '';
      };

      directory = lib.mkOptions {
        type = lib.types.submodule {
          options = {
            tex = lib.mkOption {
              type = lib.types.path;
              default = ~/blogtex/tex;
              description = ''
                Path to directory that stores your tex files
              '';
            };
            html = lib.mkOption {
              type = lib.types.path;
              default = ~/blogtex/tex;
              description = ''
                Path to directory that stores your tex files
              '';
            };
          };
        };
      };

      styles = lib.mkOption {
        type = lib.types.path;
        default = ~/blogtex/tex;
        description = ''
          Path to directory that stores your tex files
        '';
      };
      blog-url = lib.mkOption {
        type = lib.types.path;
        default = ~/blogtex/tex;
        description = ''
          Path to directory that stores your tex files
        '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [config.pandoc];
    pkgs.writeShellApplication = {
      name = "blogtex";
      runtimeInputs = [cfg.package];
      text =
        /*
        bash
        */
        ''
          #paths must be absolute
          # SOURCE="/usr/share/blog-tex"
          # OUTPUT="/usr/share/blog-html"
          # CSS="/css/blog.css"
          # BLOGURL="https://swindlesmccoop.xyz/blog"
          # mkdir -p "$SOURCE" "$OUTPUT"

          #cleanup
          rm -f "$OUTPUT/*"

          #getting vars
          cd "$SOURCE"
          TEXFILES="$(ls -1 *.tex | sed 's/\.tex//g')"

          #INTENSE STREAM MANIPULATION
          egrep "date{|title{" -m 3 *.tex\
          | sed -e 's/\\date{//; s/:/ /; s/}//; /maketitle/d'\
          | paste - -\
          | sed -e 's/^/<a href="/; s/\\title{/">/; s/.*tex//2g; s/\.tex/\.html/'\
          | awk '{for (i=1; i<=NF-2; i++) printf "%s ", $i; print $NF}'\
          | sed -e 's/\(.*\) /\1<\/a> - /; s/$/<br>/'\
          | awk '{for(i=NF;i>1;i--)printf "%s ",$i;printf "%s",$1;print ""}'\
          | sort -r -k1.7,1.10 -k1.1,1.2 -k1.4,1.5\
          | awk '{for(i=NF;i>1;i--)printf "%s ",$i;printf "%s",$1;print ""}'\
          > $SOURCE/files.html

          cat $SOURCE/header.html $SOURCE/files.html > $OUTPUT/index.html
          rm $SOURCE/files.html
          cp $SOURCE/header.xml $OUTPUT/rss.xml

          _texgrep() { grep -m 1 "$1" "$2" | grep -o "{.*}" | sed -e 's/{//; s/}//' ;}

          DATED="$(grep -o '<a href=".* ">' $OUTPUT/index.html | sed -e 's/<a href="//; s/\.html ">//')"
          for file in $DATED; do
          	printf "Compiling \033[0;32m"$file".tex\033[0m\n"
          	TITLE="$(_texgrep "title{" "$file".tex)"
          	DATE="$(_texgrep "date{" "$file".tex)"
          	PUBDATE="$(date -d "$DATE" +"%a, %d %b %Y")"
          	AUTHOR="$(_texgrep "author" "$file".tex)"
          	pandoc "$file.tex" -f latex --webtex="https://latex.codecogs.com/svg.latex?" -t html -s -o "$OUTPUT/$file.html" --css=$CSS

          	#construct RSS
          	printf "Adding \033[0;32m"$file".html\033[0m to RSS feed\n"
          	printf "
          <item>
          <title>$TITLE</title>
          <guid>$BLOGURL/$file.html</guid>
          <pubDate>$PUBDATE</pubDate>
          <description><![CDATA[
          $(cat $OUTPUT/$file.html | sed -e 's/%/%%/g; /<h1 class="title">/d; /<p class="date">/d')
          ]]></description>
          </item>
          " >> $OUTPUT/rss.xml
          done

          printf "</channel>\n</rss>" >> $OUTPUT/rss.xml
        '';
    };
    home.file = {
      # add /css/blog.css
      "header.html" = {
        text =
          /*
          html
          */
          ''
            <!DOCTYPE html>
            <link rel="stylesheet" href="/css/blog.css">
            <title>${cfg.title}</title>

            <h1>${cfg.title}</h1>
            <p><i>${cfg.subtitle}</i></p>
          '';
      };
      "header.xml" = {
        text =
          /*
          xml
          */
          ''
            <?xml version="1.0" encoding="utf-8"?>
            <?xml-stylesheet type="text/css" href="/css/rss.css"?>
            <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">

            <channel>
            <title>${cfg.title}</title>
            <description>${cfg.subtitle}</description>
            <language>en-us</language>
            <link>${cfg.url}/rss.xml</link>
            <atom:link href="${cfg.url}/rss.xml" rel="self" type="application/rss+xml" />

            <!-- <image> -->
            <!-- <title>${cfg.title}</title> -->
            <!-- <url>${cfg.url}/images/cat.png</url> -->
            <!-- <link>${cfg.url}/rss.xml</link> -->
            <!-- </image> -->

            <!--Content-->
          '';
      };
    };
  };
}
