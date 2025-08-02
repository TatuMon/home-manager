pkgs: {
    enable = true;
    theme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
        name = "Zafiro-icons-Dark";
        package = pkgs.zafiro-icons;
    };
    cursorTheme = {
        name = "Vimix-cursors";
        size = 35;
        package = pkgs.vimix-cursors;
    };
    font = {
        name = "Adwaita Sans";
        size = 12;
    };
}
