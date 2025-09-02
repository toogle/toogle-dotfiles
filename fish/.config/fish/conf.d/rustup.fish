set --global --export RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set --global --export CARGO_HOME "$XDG_DATA_HOME/cargo"

if test -f "$CARGO_HOME/env.fish"
    source "$CARGO_HOME/env.fish"
end
