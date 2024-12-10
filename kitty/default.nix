nixpkgs2411 : {
  enable = true;
  font = { name = "GohuFont uni14 Nerd Font Mono"; };
  settings = {
    background_opacity = "0.9";
  };
  package = nixpkgs2411.pkgs.kitty;
}
