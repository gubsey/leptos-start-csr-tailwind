{
    description = "A development environment for building EPB-Tools";

    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    outputs = { self, nixpkgs }:
    let
        supportedSystems = [ "x86_64-linux" ];
        forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
            pkgs = import nixpkgs { inherit system; };
        });
    in {
        devShells = forEachSupportedSystem ({ pkgs }: {
            default = pkgs.mkShell {
                packages = with pkgs; [
                    cargo
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
                    echo you are in a flake
                    export PS1=FLAKE\ $PS1
                '';
            };
        });
    };
}