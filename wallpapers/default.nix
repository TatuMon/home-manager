{
  pkgs ? import <nixpkgs> { },
}:

let
  repoUrl = "https://github.com/TatuMon/wallpapers";
  repoName = "wallpapers";
in
pkgs.stdenv.mkDerivation {
  name = "tatumon-wallpapers-collection";
  src = builtins.fetchGit {
    url = repoUrl;
    name = repoName;
    rev = "58333b0a3a3d410c8112f3cb5542bbe7ddadcf55";
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
