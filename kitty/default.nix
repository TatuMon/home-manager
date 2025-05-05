{ pkgs, config } : {
  enable = true;
  font = { name = "JetBrainsMono Nerd Font"; };
  settings = {
    background_opacity = "0.9";
    font_size = "14";
  };
  package = config.lib.nixGL.wrap pkgs.kitty;
}
