{ pkgs, config }:
{
  enable = true;
  settings = {
    font_family = "Iosevka Nerd Font Mono";
    font_size = "10";
    background_opacity = "0.9";
  };
  package = config.lib.nixGL.wrap pkgs.kitty;
}
