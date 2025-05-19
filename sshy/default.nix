# Derivation to install rofi themes
{ pkgs ? import <nixpkgs> {} }:

let
    version = "v0.1.2";
    naersk = pkgs.callPackage (builtins.fetchGit {
        url = "https://github.com/nix-community/naersk.git";
    }) {};
    sshySrc = pkgs.fetchFromGitHub {
        owner = "TatuMon";
        repo = "sshy";
        tag = version;
        hash = "sha256-gQYsshWA5F4744OxUSvHrwgkFLN1UALdtfFawRP8YhI=";
    };
in
naersk.buildPackage {
    src = sshySrc;
}
