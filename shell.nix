let 
  pkgs = import <nixpkgs> {};
in
pkgs.stdenv.mkDerivation {
  name = "epb-tool";
  system = "x86_64-linux";
  buildInputs = with pkgs; [
    cargo
    trunk
    lld
    wasm-bindgen-cli
    tailwindcss
    tmux
    cacert
    git
  ];

  shellHook = ''
    export NIX_ENFORCE_PURITY=0 # needed for ld to link properly
    tmux \
      new-session -s nix_shell "trunk serve" \;\
      split-window -h "tailwindcss -i input.css -o style/tailwind.css -wm" \;\
      set-option remain-on-exit on
    tmux kill-session -t nix_shell
    exit
  '';
}
