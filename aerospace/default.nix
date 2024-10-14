{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
    name = "aerospace";
    meta = {
        description = "i3 for macOS";
        homepage = "https://nikitabobko.github.io/AeroSpace/guide";
        platforms = pkgs.lib.platforms.darwin ++ [ "aarch64-apple-darwin" ];
    };

    src = pkgs.fetchzip {
        url = "https://github.com/nikitabobko/AeroSpace/releases/download/v0.14.2-Beta/AeroSpace-v0.14.2-Beta.zip";
        hash = "sha256-v2D/IV9Va0zbGHEwSGt6jvDqQYqha290Lm6u+nZTS3A";
    };

    buildPhase = ''
        echo 'No build needed'
    '';

    installPhase = ''
        mkdir -p $out/bin
        mkdir -p $out/Applications

        cp bin/aerospace $out/bin
        cp -r AeroSpace.app $out/Applications
    '';
}
