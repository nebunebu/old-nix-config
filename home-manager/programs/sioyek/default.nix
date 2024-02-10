{
  programs.sioyek = {
    enable = true;
    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "move_left" = "h";
      "move_right" = "k";

      "new_window" = "<C-t>";
    };
    config = {
      "background_color" = "0.0 0.0 0.0";
    };
  };
}
