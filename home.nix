{ config, pkgs, ... }:

{
  home.username = "radar";
  home.homeDirectory = "/home/radar";

  home.packages = with pkgs; [
    fastfetch
    yazi
    ani-cli
    hugo

    # archives
    unzip
    zip

    # cli tools
    fzf
    ripgrep
    fd
    eza
    bat
    delta
    tldr

    btop
    htop

    lazygit

    qbittorrent

    # containers
    podman
    podman-tui

    # applications
    alacritty
    zathura

    # password manager
    keepassxc
  ];

  programs.tmux = {
    enable = true;
    extraConfig = ''
        set-option -g default-terminal "tmux-256color"
	set-option -ga terminal-overrides ",xterm-256color:Tc"

	set -g mouse on

	set-option -g focus-events on

	unbind C-b

	set-option -g prefix C-Space
	bind-key C-Space send-prefix

	setw -g mode-keys vi

	# Undercurl
	set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
	set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0

	set -g base-index 1

	setw -g pane-base-index 1

	set -sg escape-time 1

	set -g history-limit 1000000

	bind '%' split-window -c '#{pane_current_path}' -h
	bind '"' split-window -c '#{pane_current_path}'

	bind g new-window -c '#{pane_current_path}' -n lazygit lazygit

	bind ^ last-window
	bind k select-pane -U
	bind j select-pane -D
	bind h select-pane -L
	bind l select-pane -R

	bind -r H resize-pane -L 5
	bind -r L resize-pane -R 5
	bind -r J resize-pane -U 5
	bind -r K resize-pane -D 5

	set -g status-style 'fg=#d3869b bg=default'
    '';
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}