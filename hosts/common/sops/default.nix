{
  inputs,
  config,
  ...
}: let
  p = config.sops.placeholder;
in {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    age.keyFile = "/home/nebu/.config/sops/age/keys.txt";
    secrets.imgur_client_id = {};
    secrets.oauth_client_id = {};
    secrets.oauth_client_secret = {};

    templates."tuir.secrets" = {
      owner = "nebu";
      path = "/home/nebu/.config/tuir/tuir.secrets";
      content = ''
        imgur_client_id = ${p.imgur_client_id}
        oauth_client_id = ${p.oauth_client_id}
        oauth_client_secret = ${p.oauth_client_secret}
      '';
    };
  };
}
