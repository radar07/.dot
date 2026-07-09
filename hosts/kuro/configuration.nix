{ pkgs, inputs, ... }:

{
  # Architecture — Apple Silicon
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Pin to nixpkgs-unstable (required by nix-darwin master branch)
  nixpkgs.pkgs = inputs.nixpkgs-darwin.legacyPackages.aarch64-darwin;

  # Required: set once at install time, do not change
  system.stateVersion = 5;

  # Primary user (required by recent nix-darwin for some system options)
  system.primaryUser = "radar";

  networking.hostName = "kuro";
  networking.computerName = "kuro";

  # Nix daemon settings
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    trusted-users = [ "radar" ];
  };

  # Garbage collection (weekly, keep 3 weeks)
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    };
    options = "--delete-older-than 3w";
  };

  # Shell
  programs.zsh.enable = true;

  # User definition (required for home-manager)
  users.users.radar = {
    name = "radar";
    home = "/Users/radar";
    shell = pkgs.zsh;
  };

  # Minimal system-wide packages (user packages live in home-manager)
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    nixd
    nixfmt-rfc-style
  ];

  # Touch ID for sudo (also works inside tmux via pam_reattach)
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true;
  };

  # macOS system defaults
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      minimize-to-application = true;
      mru-spaces = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv"; # list view
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false; # enable key repeat instead of accent popup
      "com.apple.swipescrolldirection" = false; # natural scroll off
    };

    trackpad.Clicking = true; # tap to click
  };

  # Homebrew — for GUI apps and casks not available in nixpkgs
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # remove unlisted brews/casks on rebuild
    onActivation.autoUpdate = true;

    brews = [ ];

    casks = [
      "ghostty" # terminal (macOS native build via cask)
      "discord"
      "obs"
      "vlc"
      "qbittorrent"
    ];
  };
}
