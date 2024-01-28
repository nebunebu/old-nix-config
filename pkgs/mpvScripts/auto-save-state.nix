{
  lib,
  fetchurl,
  buildLua,
}:
buildLua {
  pname = "auto-save-state";

  version = "unstable-2024-01-18";
  src = fetchurl {
    url = "https://raw.githubusercontent.com/AN3223/dotfiles/master/.config/mpv/scripts/auto-save-state.lua";
    hash = "0zjx6if3ybcnf6x18zw1wiarc59saswlgkprggxhpb8wqz9r33g2";
  };

  meta = {
    description = "Runs write-watch-later-config-periodically";
    longDescription = ''
    '';
    homepage = "https://github.com/AN3223/dotfiles/blob/master/.config/mpv/scripts/auto-save-state.lua";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [nebunebu];
  };
}
