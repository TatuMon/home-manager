# Derivation to install rofi themes
{ pkgs ? import <nixpkgs> {} }:

let
    repoUrl = "https://github.com/newmanls/rofi-themes-collection";
    repoName = "rofi-custom";
in
pkgs.stdenv.mkDerivation {
    name = "rofi-themes-collection";
    src = builtins.fetchGit {
        url = repoUrl;
        name = repoName;
    };

    dontBuild = true;
    dontConfigure = true;
    preferLocalBuild = true;
    allowSubstitutes = false;

    installPhase = ''
        mkdir -p $out/share/rofi/themes
        cp -r $src/themes/* $out/share/rofi/themes/
    '';
}

