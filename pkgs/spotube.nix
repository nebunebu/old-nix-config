{ lib
, stdenv
, fetchurl

, autoPatchelfHook
, dpkg
, makeWrapper
, wrapGAppsHook

, libappindicator
, libnotify
, libsecret
, mpv-unwrapped
, xdg-user-dirs
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "spotube";
  version = "3.4.0";

  src = fetchurl {
    url = "https://github.com/KRTirtho/spotube/releases/download/v${finalAttrs.version}/Spotube-linux-x86_64.deb";
    hash = "sha256-XBciTNWsmaY1C8ji+SCWWP/M/uIDZHM9fi9wucHJsBY=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    dpkg
    makeWrapper
    wrapGAppsHook
  ];

  buildInputs = [
    libappindicator
    libnotify
    libsecret
    mpv-unwrapped
  ];

  dontWrapGApps = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    mv usr/* $out
    runHook postInstall
  '';

  preFixup = ''
    patchelf $out/share/spotube/lib/libmedia_kit_native_event_loop.so \
        --replace-needed libmpv.so.1 libmpv.so.2
  '';

  postFixup = ''
    makeWrapper $out/share/spotube/spotube $out/bin/spotube \
        "''${gappsWrapperArgs[@]}" \
        --prefix LD_LIBRARY_PATH : $out/share/spotube/lib:${lib.makeLibraryPath [ mpv-unwrapped ]} \
        --prefix PATH : ${lib.makeBinPath [ xdg-user-dirs ]}
  '';

  meta = {
    changelog = "https://github.com/KRTirtho/spotube/blob/v${finalAttrs.version}/CHANGELOG.md";
    description = "An open source Spotify client";
    longDescription = ''
      Spotube is an open source, cross-platform Spotify client that
      doesn't require Premium nor uses Electron
    '';
    homepage = "https://spotube.netlify.app/";
    license = lib.licenses.bsdOriginal;
    maintainers = with lib.maintainers; [ tomasajt ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
})
