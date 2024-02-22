{ pkgs, inputs, ... }:

{
  services.hydra = {
    package = inputs.hydra.packages."${pkgs.system}".hydra;
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [ ];
    useSubstitutes = true;
  };
}
