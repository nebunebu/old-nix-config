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
    secrets.example_key = {};

    templates."tuir.cfg" = {
      owner = "nebu";
      path = "/home/nebu/tuir.cfg";
      content = ''
       password = "${config.sops.placeholder.example_key}"
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
