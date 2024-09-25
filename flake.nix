{
    description = "A development environment for building EPB-Tools";

    input.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    outputs = { self, nixpkgs }:
    let
        supportedSystems = [ "x86_64-linux" ];
        forEachSupportdSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
            pkgs = import nixpkgs {};
        });
    in {
        devShells = forEachSupportedSystem ({ pkgs }: {
            default = pkgs.mkShell {
                packages = with pkgs; [
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
            };
        });
    };
}