{ pkgs ? import <nixpkgs> {} }:

let
    repoUrl = "https://github.com/TatuMon/wallpapers";
    repoName = "wallpapers";
in
pkgs.stdenv.mkDerivation {
    name = "tatumon-wallpapers-collection";
    src = builtins.fetchGit {
        url = repoUrl;
        name = repoName;
    };

    dontBuild = true;
    dontConfigure = true;
    preferLocalBuild = true;
    allowSubstitutes = false;

    installPhase = ''
        mkdir -p $out/wallpapers
        cp -r $src/* $out/wallpapers/
    '';
}

