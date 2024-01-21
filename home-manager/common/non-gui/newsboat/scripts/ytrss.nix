{ pkgs, ... }:

{
  home.packages = [
  (pkgs.writeShellScriptBin "ytrss" ''
  #!/run/current-system/sw/bin/bash
CHANNEL_ID="UC${1##*UC}"

# [ "${CHANNEL_ID:0:2}" == "UU" ] && CHANNEL_ID="${CHANNEL_ID/UU/UC}"

JSON_OUTPUT="${CHANNEL_ID}.json"

[[ ! -d /tmp/ytrss ]] && mkdir /tmp/ytrss/
[[ ! -d "${XDG_CONFIG_HOME}/newsboat/ythist/" ]] && mkdir "ythist/"

YT_HIST_DIR="ythist/" 
TMP_JSON="/tmp/ytrss/${JSON_OUTPUT}"
TMP_VIDEOS="/tmp/ytrss/videos.json"
TMP_MERGED="/tmp/ytrss/merged.json"

curl -s "https://invidious.io.lol/api/v1/channels/${CHANNEL_ID}/videos" | jq '.' > $TMP_JSON

AUTHOR=$(jq -r '.videos[].author' $TMP_JSON | head -n 1)
CONTINUATION=$(jq -r '.continuation' $TMP_JSON)
echo $(jq '.videos' $TMP_JSON) > $TMP_VIDEOS

while [[ -n "$CONTINUATION" && "$CONTINUATION" != "null" ]]; do
	curl -s "https://invidious.io.lol/api/v1/channels/${CHANNEL_ID}/videos?continuation=${CONTINUATION}" | jq '.' > $TMP_JSON
	CONTINUATION=$(jq -r '.continuation' $TMP_JSON)
	jq '. +input.videos' $TMP_VIDEOS $TMP_JSON > $TMP_MERGED
	mv $TMP_MERGED $TMP_VIDEOS
done

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<feed xmlns:yt=\"http://www.youtube.com/xml/schemas/2015\" xmlns:media=\"http://search.yahoo.com/mrss/\" xmlns=\"http://www.w3.org/2005/Atom\" xml:lang=\"en-US\">
  <link rel=\"self\" href=\"/feed/channel/${CHANNEL_ID}\"/>" > "${YT_HIST_DIR}/${CHANNEL_ID}.xml"

jq -r '
  def escapeXML: 
    gsub("&"; "&#38;")
    | gsub("<"; "&#60;")
    | gsub(">"; "&#62;")
    | gsub("\""; "&#34;")
    | gsub("'"'"'"; "&#39;");

  def decrementDate($days):
    (now - ($days * 86400)) | strftime("%Y-%m-%dT%H:%M:%S+00:00");

  . as $videos | range(0; $videos | length) as $index |
  $videos[$index] | "
\t<entry>
\t\t<id>yt:video:\(.videoId)</id>
\t\t<yt:videoId>\(.videoId)</yt:videoId>
\t\t<yt:channelId>\(.authorId)</yt:channelId>
\t\t<title>\(.title | escapeXML)</title>
\t\t<link rel=\"alternate\" href=\"https://www.youtube.com/watch?v=\(.videoId)\"/>
\t\t<author>
\t\t\t<name>\(.author)</name>
\t\t\t<uri>\(.authorUrl)</uri>
\t\t</author>
\t\t<content type=\"xhtml\">
\t\t\t<div xmlns=\"http://www.w3.org/1999/xhtml\">
\t\t\t\t<a href=\"/watch?v=\(.videoId)\">
\t\t\t\t\t<img src=\"\(.videoThumbnails[] | select(.quality == "medium").url)\"/>
\t\t\t\t</a>
\t\t\t\t<p style=\"word-break:break-word;white-space:pre-wrap\">\(.description | escapeXML)</p>
\t\t\t</div>
\t\t</content>
\t\t<published>" + (decrementDate($index)) + "</published>
\t\t<media:group>
\t\t\t<media:title>\(.title | escapeXML)</media:title>
\t\t\t<media:thumbnail url=\"\(.videoThumbnails[] | select(.quality == "medium").url)\" width=\"320\" height=\"180\"/>
\t\t\t<media:description>\(.description | escapeXML)</media:description>
\t\t</media:group>
\t\t<media:community>
\t\t\t<media:statistics views=\"\(.viewCount)\"/>
\t\t</media:community>
\t</entry>"' $TMP_VIDEOS >> "${YT_HIST_DIR}/${CHANNEL_ID}.xml"

echo '</feed>' >> "${YT_HIST_DIR}/${CHANNEL_ID}.xml"

sed -i "/${CHANNEL_ID}/a file:///${YT_HIST_DIR}/${CHANNEL_ID}.xml \"~${AUTHOR} Upload History\"" "${XDG_CONFIG_HOME}/newsboat/urls"

echo "Restart newsboat for changes to take effect"
sleep 1
  '')
  ];
}
