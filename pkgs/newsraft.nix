{
  lib,
  stdenv,
  fetchFromGitea,
  pkg-config,
  curl,
  expat,
  gumbo,
  ncurses,
  sqlite,
  yajl,
}:
stdenv.mkDerivation rec {
  pname = "newsraft";
  version = "0.23";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "newsraft";
    repo = "newsraft";
    rev = "newsraft-${version}";
    hash = "sha256-c5yN67FL4siPyO8v0RuTCznwrqX9+r8tY5PKS4zlqIc=";
  };

  nativeBuildInputs = [pkg-config];
  buildInputs = [curl expat gumbo ncurses sqlite yajl];

  makeFlags = ["PREFIX=$(out)"];

  meta = with lib; {
    description = "Feed reader for terminal";
    homepage = "https://codeberg.org/grisha/newsraft";
    license = licenses.isc;
    maintainers = with maintainers; [arthsmn];
    mainProgram = "newsraft";
    platforms = platforms.all;
  };
}
