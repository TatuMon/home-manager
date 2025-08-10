pkgs:
pkgs.stdenv.mkDerivation {
    name = "kaze";
    src = builtins.fetchGit {
        url = "https://github.com/0hStormy/Kaze";
        name = "Kaze";
    };
    
    nativeBuildInputs = [ pkgs.gtk3 ];

    dontBuild = true;
    dontConfigure = true;
    preferLocalBuild = true;
    allowSubstitutes = false;
    dontDropIconThemeCache = true;
    dontRewriteSymlinks = true;

    installPhase = ''
        mkdir -p $out/share/icons/Kaze
        cp -r $src/* $out/share/icons/Kaze/

        gtk-update-icon-cache $out/share/icons/Kaze
    '';
}

