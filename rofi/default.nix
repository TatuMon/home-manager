pkgs: {
  enable = true;
  plugins = [ pkgs.rofi-calc ];
  theme = "squared-nord";
  extraConfig = {
    drun-display-format = "{name}";
    display-drun = "󰍉";
    show-icons = true;
  };
}
