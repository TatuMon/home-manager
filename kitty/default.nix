{ pkgs, config } : {
  enable = true;
  font = { name = "GohuFont uni14 Nerd Font Mono"; };
  settings = {
    background_opacity = "0.9";
  };
  package = config.lib.nixGL.wrap pkgs.kitty;
}
