{ pkgs, config, ... }:

{
  home.file = {
    ".config/tuir/tuir.cfg.init".source = ./tuir.cfg;
    ".config/tuir/mailcap".source = ./mailcap;
  };
  home.packages = with pkgs; [
    tuir
  ];

  home.sessionVariables = {
    TUIR_EDITOR = "nvim";
    TUIR_BROWSER = "firefox";
    TUIR_URLVIEWER = "test";
  };

  systemd.user.services.tuir-init = {
    Install.WantedBy = [ "default.target" ];
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.writeShellScript "tuir-cat" ''
      #!/run/current-system/sw/bin/bash
      ${pkgs.coreutils}/bin/cat /home/nebu/.config/tuir/tuir.cfg.init /home/nebu/.config/tuir/tuir.secrets > /home/nebu/.config/tuir/tuir.cfg
      ${pkgs.coreutils}/bin/rm  /home/nebu/.config/tuir/tuir.cfg.init /home/nebu/.config/tuir/tuir.secrets 
    ''}";
    };
  };
}

