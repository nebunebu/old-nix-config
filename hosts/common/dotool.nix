{pkgs, ...}: {
  environment.systemPackages = [pkgs.dotool];

  users.groups = {
    input = {};
  };

  users.users.nebu = {
    isNormalUser = true;
    extraGroups = ["wheel" "input" "uinput"];
  };

  # makes dotool work
  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
  '';
}
