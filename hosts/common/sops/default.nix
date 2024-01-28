{
  inputs,
  config,
  ...
}: {
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
      path = "/home/nebu/demo/tuir.secrets";
      content = with config.sops.placeholder; ''
        imgur_client_id = ${imgur_client_id}
        oauth_client_id = ${oauth_client_id}
        oauth_client_secret = ${oauth_client_secret}
      '';
    };
  };
}
