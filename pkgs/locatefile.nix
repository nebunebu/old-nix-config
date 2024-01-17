{ lib
, fetchFromGitHub
, unstableGitUpdater
, buildLua }:

buildLua rec {
  pname = "mpv-locatefile-lua-script";

  version = "unstable-2024-01-17";
  src = fetchFromGitHub {
    owner = "nimatrueway";
    repo  = pname;
    rev   = "e813f75";
    hash  = "";
  };
  passthru.updateScript = unstableGitUpdater {};

  meta = {
    platforms = lib.platforms.all;
    description = "A tiny lua script for mpv that opens current media file OS/web browser";
    homepage = "https://github.com/nimatrueway/mpv-locatefile-lua-script";
    maintainers = with lib.maintainers; [ nebunebu ];
  };
}
