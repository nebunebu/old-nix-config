{

  virtualisation = {
    libvirtd.enable = true;
    libvirtd.onBoot = "start";
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
