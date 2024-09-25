let pkgs = import <nixpkgs> {};
in 
pkgs.stdenv.mkDerivation {
  name = "epb-tool";
  system = "x86_64-linux";
  src = ./.;
  nativeBuildInputs = with pkgs; [ 
    cargo
    lld 
    dioxus-cli 
  ];
}
