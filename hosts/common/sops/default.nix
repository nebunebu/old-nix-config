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
      path = "/home/nebu/.config/tuir/tuir.secrets";
      content = ''
        imgur_client_id = ${config.sops.placeholder.imgur_client_id}
        oauth_client_id = ${config.sops.placeholder.oauth_client_id}
        oauth_client_secret = ${config.sops.placeholder.oauth_client_secret}
      '';
    };
  };

   # systemd.services."sometestservice" = {
   #   script = ''
   #   echo "
   #     I'm a service sending a secure password 
   #     $(cat ${config.sops.secrets."example_key".path})
   #     " > /var/lib/sometestservice/testfile
   #   '';
   #   serviceConfig = {
   #     User = "sometestservice";
   #     WorkingDirectory = "/var/lib/sometestservice";
   #   };
   # };
   #
   # users.users.sometestservice = {
   #   home = "/var/lib/sometestservice";
   #   createHome = true;
   #   isSystemUser = true;
   #   group = "sometestservice";
   # };
   # users.groups.sometestservice = {};
}
