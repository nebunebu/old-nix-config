{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common/configuration.nix
    ];

  networking.hostName = "g500s";
  home-manager.users.nebu = import ../../home-manager/g500s/home.nix;

  users.users.nebu = {
    isNormalUser = true;
    description = "nebu";
    extraGroups = [ "networkmanager" "wheel" "jellyfin" "docker" ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    kitty
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  services = {
    upower.ignoreLid = true;
    logind.lidSwitch = "ignore";
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
    taskserver = {
      enable = true;
      organisations.my-taskserver.users = [ "nebu"];
    };
  };

  systemd = {
    tmpfiles.settings = {
      "jellyfin" = {
        "/media/Movies/" = {
          d = {
            group = "jellyfin";
            mode = "770";
            user = "jellyfin";
            age = "-";
          };
        };
        "/media/Music/" = {
          d = {
            group = "jellyfin";
            mode = "770";
            user = "jellyfin";
            age = "-";
          };
        };
        "/media/Shows/" = {
          d = {
            group = "jellyfin";
            mode = "770";
            user = "jellyfin";
            age = "-";
          };
        };
        "/media/Courses/" = {
          d = {
            group = "jellyfin";
            mode = "770";
            user = "jellyfin";
            age = "-";
          };
        };
        "/media/Other/" = {
          d = {
            group = "jellyfin";
            mode = "770";
            user = "jellyfin";
            age = "-";
          };
        };
      };
    };
  };
}
