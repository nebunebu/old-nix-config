{ config
, pkgs
, ...
}: {
  # Stuff for nvidia proprietary drivers I don't actually use
  hardware = {
    nvidia = {
      modesetting.enable = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
      nvidiaSettings = true;
    };
  };

  environment = {
    sessionVariables = { };
    systemPackages = builtins.attrValues {
      inherit
        (pkgs)
        cudatoolkit
        nvtop
        ;
    };
  };

  boot.initrd.kernelModules = [ "nvidia" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.nvidia.acceptLicense = true;
}
