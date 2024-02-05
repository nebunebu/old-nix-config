{
  outputs,
  config,
  ...
}: {
  imports = [
    outputs.homeManagerModules.blahg
  ];

  programs.blahg = {
    enable = true;
    # package = pkgs.pandoc;
    directory = "${config.home.homeDirectory}/Projects/blahg";
    title = "abc";
    description = "stuff stuff stuff";
    url = "http://nebunebu.xyz";
    # html-header = '''';
    # xml-header = '''';
  };
}
