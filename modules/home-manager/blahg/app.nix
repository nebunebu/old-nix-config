{
  writeShellApplication,
  pkgs,
  config,
  ...
}:
# let
#   cfg = config.program.blahg;
#   src = "${config.programs.blahg}/src";
#   dst = "${config.programs.blahg}/dst";
#   tmp = "${config.programs.blahg}/tmp";
# in
writeShellApplication {
  name = "blahgc";
  runtimeInputs = [pkgs.cowsay];
  text = ''

    _texgrep() {
        grep -m 1 "$1" "$2"\
            | grep -o "{.*}"\
            | sed -e 's/{//; s/}//';
    }

    DATED=$(grep -o '<a href=".* ">' ${dst}/index.html | sed -e 's/<a href="//; s/\.html ">//')

    for f in $DATED; do
    ${cfg.package} $f.tex -f latex\
    --webtex="https://latex.codecogs.com/svg.latex?"\
    -t html -s -o ${src}/$f.html"\
    --css="/styles/main.css"

    printf "Adding \033[0;32m%s.html\033[0m to RSS feed\n" "$f"
    printf "
        <item>
        <title>%s</title>
        <guid>%s/%s.html</guid>
        <pubDate>%s</pubDate>
        <description><![CDATA[
        %s
        ]]></description>
        </item>
        " $(_texgrep "title{" $f.tex)\
        ${cfg.url}\
        $f\
        $(date -d "$DATE" +"%a, %d %b %Y")\
        $(sed -e 's/%/%%/g; /<h1 class="title">/d; /<p class="date">/d' ${dst}/$f.html)\
        >> ${dst}/rss.xml
    done

    printf "</channel>\n</rss>" >> ${dst}/rss.xml
  '';
}
