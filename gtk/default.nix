pkgs: {
    enable = true;
    theme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
        name = "Kaze";
        package = import ../icons/kaze.nix pkgs;
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
