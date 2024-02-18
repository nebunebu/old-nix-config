{
  services.spice-vdagentd.enable = true;

  networking.firewall.trustedInterfaces = [ "virbr0" ];
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
          volumes = [ "./ollama:/root/.ollama" ];
          ports = [ "1143:1143" ];
        };
      };
    };
  };

}
