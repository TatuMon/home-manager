pkgs: {
  enable = true;
  theme = {
    name = "Qogir-Dark";
    package = pkgs.qogir-theme;
  };
  colorScheme = "dark";
  iconTheme = {
    name = "Qogir-Dark";
    package = pkgs.qogir-icon-theme;
  };
  cursorTheme = {
    name = "Nordzy-catpuccin-latte-dark";
    size = 35;
    package = pkgs.nordzy-cursor-theme;
  };
  font = {
    name = "Adwaita Sans";
    size = 12;
  };
}
