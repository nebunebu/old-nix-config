{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-19.1.9"
  ];
  networking.hostName = "t5610";
  home-manager.users.nebu = import ./hm;

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    HOSTNAME = "t5610";
  };

  services.spice-vdagentd.enable = true;
  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      adminIdentities = ["unix-group:wheel"];
    };
  };

  environment.systemPackages = [
    pkgs.etcher
  ];
  networking.firewall.trustedInterfaces = ["virbr0"];
  virtualisation = {
    libvirtd.enable = true;
    libvirtd.onBoot = "start";
    waydroid.enable = false;
    docker = {
      enable = true;
    };
    oci-containers = {
      backend = "docker";
      containers = {
        "ollama" = {
          autoStart = true;
          image = "ollama/ollama";
          volumes = ["./ollama:/root/.ollama"];
          ports = ["1143:1143"];
        };
      };
    };
  };
}
