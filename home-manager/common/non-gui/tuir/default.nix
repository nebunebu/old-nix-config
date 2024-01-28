{
  pkgs,
  config,
  ...
}: let
  cat = "${pkgs.coreutils}/bin/cat";
  rm = "${pkgs.coreutils}/bin/rm";
  tuir-init = "${config.xdg.configHome}/tuir/tuir.cfg";
  tuir-secrets = "${config.xdg.configHome}/tuir/tuir.cfg";
  tuir-cfg = "${config.xdg.configHome}/tuir/tuir.cfg";
in {
  home = {
    packages = [pkgs.tuir];
    file = {
      ".config/tuir/tuir.cfg.init".source = ./tuir.cfg;
      ".config/tuir/mailcap".source = ./mailcap;
    };
    sessionVariables = {
      TUIR_EDITOR = "nvim";
      TUIR_BROWSER = "firefox";
      TUIR_URLVIEWER = "test";
    };
  };

  systemd.user.services.tuir-init = {
    Install.WantedBy = ["default.target"];
    Service = {
      Type = "simple";
      # TODO: Rewrite using sed
      ExecStart = "${pkgs.writeShellScript "tuir-cat" ''
        ${cat} ${tuir-init} ${tuir-secrets} > ${tuir-cfg}
        ${rm} ${tuir-init} ${tuir-secrets}
      ''}";
    };
  };
}
