{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./sops/default.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  networking.networkmanager.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
  };

  users.users = {
    nebu = {
      isNormalUser = true;
      # openssh.authorizedKeys.keys = [
      #   # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      # ];
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "docker"
      ];
    };
  };

  console.useXkbConfig = true;
  services = {
    openssh.enable = true;
    getty.autologinUser = "nebu";
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      xkbOptions = "caps:swapescape";
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = true;
    };
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix  = {
    settings = {
      experimental-features = [ "nix-command flakes" ];
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
      trusted-users = [ "@wheel" ];
    };
  gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    };
    nixPath = [
      "nixpkgs=${pkgs.path}"
    ];
  };

  environment = {
    systemPackages = [
      pkgs.git pkgs.sops pkgs.wl-clipboard
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    mtr.enable = true;
    zsh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    dconf.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      adminIdentities = [ "unix-group:wheel" ];
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  # services.openssh = {
  #   enable = true;
  #   settings = {
  #     # Forbid root login through SSH.
  #     PermitRootLogin = "no";
  #     # Use keys only. Remove if you want to SSH using password (not recommended)
  #     # PasswordAuthentication = false;
  #   };
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.11";
}
