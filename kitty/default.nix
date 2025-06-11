{ pkgs, config } : {
  enable = true;
  settings = {
    font_family = "JetBrainsMono Nerd Font";
    font_size = "14";
    background_opacity = "0.9";
  };
  package = config.lib.nixGL.wrap pkgs.kitty;
}
