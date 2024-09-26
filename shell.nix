let 
  pkgs = import <nixpkgs> {};
in
pkgs.stdenv.mkDerivation {
  name = "epb-tool";
  system = "x86_64-linux";
  buildInputs = with pkgs; [
    cargo
    cargo-generate
    trunk
    lld
    wasm-bindgen-cli
    tailwindcss

    # shell only
    rust-analyzer
    nil
    helix
    simple-http-server
  ];

  shellHook = ''
    cargo --version
    trunk --version
    tailwindcss -h | grep tailwindcss\ v --color=never
  '';
}
