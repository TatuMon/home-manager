pkgs: {
  enable = true;
  plugins = [ pkgs.rofi-calc ];
  theme = "squared-nord";
  modes = [
    "drun"
    "calc"
    "filebrowser"
    "window"
  ];
  extraConfig = {
    drun-display-format = "{name}";
    display-drun = "󰍉";
    show-icons = true;
  };
}
