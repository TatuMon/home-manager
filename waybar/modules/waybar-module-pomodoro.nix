{ pkgs ? import <nixpkgs> {} }:
pkgs.rustPlatform.buildRustPackage (finalAttrs: {
  name = "waybar-module-pomodoro";

  src = pkgs.fetchFromGitHub {
    owner = "Andeskjerf";
    repo = "waybar-module-pomodoro";
    hash = "sha256-QB/EQlFRyapaqbllun6ttxiYO7/qlAHsVjgKVsHkUTI=";
    rev = "b5e5d9b83906bd3a40f4c1d118cdb1d40884a9ad";
  };

  cargoHash = "sha256-N1xuKml9cRDix0SOVBKJydTN35EKk+ohnXhInsMG3HY=";

  doCheck = false;

  buildPhase = ''
    cargo build --release
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp target/release/waybar-module-pomodoro $out/bin/
  '';

  postInstall = ''
    rm -f $out/bin/rg
  '';

  meta = {
    description = "A pomodoro timer intended for Waybar";
    homepage = "https://github.com/Andeskjerf/waybar-module-pomodoro";
    maintainers = [ ];
  };
})
