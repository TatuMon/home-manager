nixpkgs2411 : {
  enable = true;
  font = { name = "GohuFont uni14 Nerd Font Mono"; };
  settings = {
    background_opacity = "0.70";
  };
  package = nixpkgs2411.pkgs.kitty;
}
