{
  enable = true;
  settings = builtins.fromJSON (builtins.readFile ./config.json);
  style = ./style.css;
}
