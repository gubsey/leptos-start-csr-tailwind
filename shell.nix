let 
  pkgs = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz){};
  dx = pkgs.rustPlatform.buildRustPackage rec {
    pname = "dioxus-cli";
    version = "0.5.7";
    github = pkgs.fetchCrate {
      inherit pname version;
      hash = "sha256-/LeMh5WX4dvkveu5w6qBQLbtoi5yUW6iad0YatA/tMQ=";
    };
    src = github;
    cargoBuildFlags = "-p dioxus-cli";

    nativeBuildInputs = [
      pkgs.pkg-config
      pkgs.cacert
      pkgs.glib
    ];
    buildInputs = [

      pkgs.openssl
    ];    
    OPENSSL_NO_VENDOR = 1;

    cargoHash = "sha256-D6y2NiFqSf0u6icSKCRZK7ycR+GswOX627M7PEy/D6U=";
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
