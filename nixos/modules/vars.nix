{
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";

    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";

    PATH = [
      "${XDG_BIN_HOME}"
      "$HOME/.zig"
      "$HOME/Code/zine/zig-out/bin"
      "${GOBIN}"
    ];
  };
}
