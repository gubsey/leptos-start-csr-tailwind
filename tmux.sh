tmux \
    new-session -s nix_shell "trunk serve" \;\
    split-window -h "tailwindcss -i input.css -o style/tailwind.css -wm" \;\
    set-option remain-on-exit on \;
tmux kill-session -t nix_shell