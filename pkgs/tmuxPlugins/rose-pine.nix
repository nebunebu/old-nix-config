{ lib
, fetchFromGitHub
, pkgs
, stdenv
}:

let
  rtpPath = "share/tmux-plugins";

  addRtp = path: rtpFilePath: attrs: derivation:
    derivation // { rtp = "${derivation}/${path}/${rtpFilePath}"; } // {
      overrideAttrs = f: mkTmuxPlugin (attrs // f attrs);
    };

  mkTmuxPlugin = a@{
    pluginName,
    rtpFilePath ? (builtins.replaceStrings ["-"] ["_"] pluginName) + ".tmux",
    namePrefix ? "tmuxplugin-",
    src,
    unpackPhase ? "",
    configurePhase ? ":",
    buildPhase ? ":",
    addonInfo ? null,
    preInstall ? "",
    postInstall ? "",
    path ? lib.getName pluginName,
    ...
  }:
    if lib.hasAttr "dependencies" a then
      throw "dependencies attribute is obselete. see NixOS/nixpkgs#118034" # added 2021-04-01
    else addRtp "${rtpPath}/${path}" rtpFilePath a (stdenv.mkDerivation (a // {
      pname = namePrefix + pluginName;

      inherit pluginName unpackPhase configurePhase buildPhase addonInfo preInstall postInstall;

      installPhase = ''
        runHook preInstall

        target=$out/${rtpPath}/${path}
        mkdir -p $out/${rtpPath}
        cp -r . $target
        if [ -n "$addonInfo" ]; then
          echo "$addonInfo" > $target/addon-info.json
        fi

        runHook postInstall
      '';
    }));

in rec {
  inherit mkTmuxPlugin;

  mkDerivation = throw "tmuxPlugins.mkDerivation is deprecated, use tmuxPlugins.mkTmuxPlugin instead"; # added 2021-03-14


  rose-pine = mkTmuxPlugin rec {
    pluginName = "rose-pine";
    version = src.rev;
    rtpFilePath = "rose-pine.tmux";
    src = fetchFromGitHub {
      owner = "rose-pine";
      repo = "tmux";
      rev = "dd6d01338ac4afeb96542dcf24e4a7fe179b69e6";
      sha256 = "sha256-Tccb4VjdotOSw7flJV4N0H4557NxRhXiCecZBPU9ICQ=";
    };
  };
}
