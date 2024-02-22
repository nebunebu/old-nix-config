{ lib
, stdenvNoCC
, fetchFromGitHub
,
}:
stdenvNoCC.mkDerivation rec {
  pname = "locate";
  version = "2024-01-17";
  src = fetchFromGitHub {
    owner = "nimatrueway";
    repo = "mpv-locatefile-lua-script";
    rev = "e813f75ed8d07b254ca79663cf8cc665915159b8";
    sha256 = "sha256-shDTn2ZyEaxXd/ci0wlxJlxfP8vkl67qjGfD7MTReuE=";
  };
  dontBuild = true;
  dontUnpack = true;
  installPhase = ''
    install -Dm644 ${src} $out/share/mpv/scripts/locate.lua
  '';

  passthru.scriptName = "locate.lua";

  meta = with lib; {
    description = "locate file";
    homepage = "https://github.com/nimatrueway/mpv-locatefile-lua-script";
    platforms = platforms.all;
    # maintainers = with maintainers; [kmein];
  };
}
