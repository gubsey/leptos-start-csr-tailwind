let 
  pkgs = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz){};
  dx = pkgs.rustPlatform.buildRustPackage rec {
    pname = "dioxus-cli";
    version = "v0.5.7";
    github = pkgs.fetchFromGitHub {
      owner = "DioxusLabs";
      repo = "dioxus";
      hash = "sha256-HantdQ0CAq7ARG29O3f/iK5eRNbxUhOC50iwmQaHbr8=";
      rev = version;
    };
    src = github;
    cargoBuildFlags = "-p dioxus-cli";

    nativeBuildInputs = [
      pkgs.pkg-config
      pkgs.cacert
    ];
    buildInputs = [
      pkgs.openssl
    ];    
    OPENSSL_NO_VENDOR = 1;

    cargoHash = "sha256-2wDMYTBnNC3uNuUAJiH1uH3gDviEETgbvHqPZeOG3ic=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "epb-tool";
  system = "x86_64-linux";
  nativebuildInputs = with pkgs; [
    cargo
    llvmPackages.bintools
    rust-analyzer
    dx
    nil
    helix
  ];
}
