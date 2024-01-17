{
  imports = [
    # ./nvidia.nix
    ./hardware-configuration.nix
    ../common/configuration.nix
  ];

  networking.hostName = "t5610";
  home-manager.users.nebu = import ../../home-manager/t5610/home.nix;
  programs.hyprland.enable = true;

  services.spice-vdagentd.enable = true;
  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      adminIdentities = [ "unix-group:wheel" ];
    };
  };

  virtualisation = {
    libvirtd.enable = true;
    waydroid.enable = true;
    docker = {
      enable = true;
    };
    oci-containers = {
      backend = "docker";
      containers = {
        "ollama" = {
          autoStart = true;
          image = "ollama/ollama";
          volumes = [ "./ollama:/root/.ollama" ];
          ports = [ "1143:1143" ];
        };
      };
    };
  };
}
