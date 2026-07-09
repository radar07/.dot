# Dotfiles

[![Demo](https://raw.githubusercontent.com/radar07/.dot/main/.github/assets/thumbnail.jpg)](https://raw.githubusercontent.com/radar07/.dot/main/.github/assets/demo.mp4)

A multi-host Nix flake managing both a NixOS desktop (`shiro`) and a macOS MacBook Pro (`kuro`) from a single repository. Shared configuration lives in `home-manager/features/` and is imported by both hosts; platform-specific modules are kept separate. Built on [NixOS](https://nixos.org/), [nix-darwin](https://github.com/nix-darwin/nix-darwin), and [home-manager](https://github.com/nix-community/home-manager).

---

## Repository Structure

```
.dot/
├── flake.nix                        # entry point — all inputs and outputs
├── flake.lock
├── hosts/
│   ├── shiro/                       # NixOS system config
│   │   ├── configuration.nix
│   │   ├── hardware-configuration.nix
│   │   └── modules/                 # boot, fonts, gaming, locale, services, etc.
│   └── kuro/                        # macOS system config (nix-darwin)
│       └── configuration.nix
├── home-manager/
│   ├── home-shiro.nix               # Linux profile entry point
│   ├── home-kuro.nix                # macOS profile entry point
│   └── features/
│       ├── cli/                     # bat, btop, fastfetch, git, gpg, lazygit,
│       │                            #   starship, tmux, vim, zsh
│       ├── dev/                     # neovim, zed
│       └── desktop/
│           ├── ghostty/             # shared config + linux.nix + darwin.nix
│           ├── mpv/
│           ├── wezterm/
│           ├── zathura/
│           └── linux/               # hyprland, hyprlock, noctalia (Linux-only)
└── nvim/                            # Neovim config (managed outside Nix, symlinked in)
```

---

## Hosts

| Host | OS | Architecture | Activation |
|---|---|---|---|
| `shiro` | NixOS (nixos-unstable) | x86\_64-linux | `nixos-rebuild switch` + standalone `home-manager switch` |
| `kuro` | macOS — Apple Silicon | aarch64-darwin | `darwin-rebuild switch` (system + home-manager in one command) |

---

## Nix Flake Inputs

| Input | Branch / Source | Purpose |
|---|---|---|
| `nixpkgs` | `nixos-unstable` | Packages for shiro (NixOS) |
| `nixpkgs-darwin` | `nixpkgs-unstable` | Packages for kuro (required by nix-darwin master) |
| `nix-darwin` | `master` | macOS system management |
| `home-manager` | follows `nixpkgs` | User environment management (both hosts) |
| `ghostty` | `ghostty-org/ghostty` | Ghostty terminal built from source (Linux) |
| `zen-browser` | `youwen5/zen-browser-flake` | Zen browser (Linux only) |
| `noctalia` | `noctalia-dev/noctalia-shell` | Custom Hyprland bar/shell (Linux only) |

---

## System Configuration — shiro (NixOS)

Managed by `nixos-rebuild switch --flake .#shiro`. Config lives in `hosts/shiro/`.

### Services & Hardware

| Service | Notes |
|---|---|
| Hyprland | Primary Wayland compositor |
| GDM + GNOME | Display manager and fallback desktop environment |
| PipeWire + WirePlumber | Audio (PulseAudio disabled) |
| Bluetooth + blueman | Hardware enabled on boot; blueman for GUI management |
| AMDGPU | Video driver for AMD graphics |
| XDG portals | Hyprland + GTK backends |
| CUPS | Printing |
| fcitx5 + mozc | Japanese input method (Wayland frontend) |
| Ollama | Local LLM inference server |
| libvirtd + virt-manager | Virtual machines |
| Docker | Containers |
| GNOME Keyring + Polkit | Credential and privilege management |
| nix-ld | Run unpatched dynamic binaries |

### System-wide Packages

**Compiler / build toolchain**

| Package | Description |
|---|---|
| `gcc`, `clang`, `clang-tools` | C/C++ compilers and tooling |
| `rustup` | Rust toolchain manager |
| `gnumake`, `cmake`, `ninja`, `meson` | Build systems |
| `bun`, `pnpm` | JavaScript runtimes / package managers |
| `openjdk21` | Java 21 |

**Editors & IDEs**

| Package | Description |
|---|---|
| `vim`, `neovim` | Terminal editors |
| `vscode`, `vscodium` | VS Code (proprietary and open-source builds) |
| `jetbrains.idea-oss` | IntelliJ IDEA Community |
| `jetbrains.pycharm-oss` | PyCharm Community |

**GUI Applications**

| Package | Description |
|---|---|
| `spotify` | Music streaming |
| `anki-bin` | Spaced-repetition flashcards |
| `dbeaver-bin` | Universal database client |
| `shotcut` | Video editor |
| `meld` | Visual diff and merge tool |

**CLI / System**

| Package | Description |
|---|---|
| `git`, `gh`, `lazygit` | Git and GitHub tooling |
| `tmux` | Terminal multiplexer |
| `eza`, `zoxide` | Modern `ls` and `cd` replacements |
| `wget`, `unzip` | Network and archive utilities |
| `nixd`, `nixfmt` | Nix language server and formatter |
| `networkmanager`, `pavucontrol` | Network and audio control |
| `pcmanfm` | GUI file manager |
| `blueman`, `bluetooth_battery`, `solaar` | Bluetooth management |
| `libnotify`, `lxappearance` | Desktop notifications and GTK theme switcher |

**From flake inputs**

| Package | Description |
|---|---|
| `ghostty` | GPU-accelerated terminal (built from source) |
| `zen-browser` | Privacy-focused Firefox-based browser |

### Gaming

| Package / Program | Description |
|---|---|
| Steam + Gamescope | Gaming platform with Wayland-native session |
| Gamemode | Optimises system performance while gaming |
| `lutris` | Open gaming platform for Wine/emulator games |
| `mangohud` | In-game performance overlay |
| `protonup-ng` | Manages Proton-GE versions |

---

## Home Manager — Shared (both hosts)

Modules in `home-manager/features/` are imported by both `home-shiro.nix` and `home-kuro.nix`.

### Shell & CLI (`features/cli/`)

| Module | Description |
|---|---|
| `zsh` | Default shell with vi-mode, autosuggestions, syntax highlighting, and aliases (`ls`→eza, `cat`→bat, `cd`→zoxide, `vim`→nvim) |
| `starship` | Prompt with custom [Jujutsu](https://github.com/martinvonz/jj) VCS integration; git modules are suppressed inside JJ repos |
| `tmux` | Multiplexer with `C-Space` prefix, vi copy-mode, and popups for lazygit and btop |
| `bat` | `cat` replacement with syntax highlighting |
| `btop` | Resource monitor (Tokyo Night theme, vim keybinds) |
| `fastfetch` | System info display (`ff` alias) |
| `git` | GPG commit signing, delta as pager, rebase workflow, rerere enabled |
| `gpg` | GPG agent with 24-hour cache |
| `lazygit` | TUI git client with delta pager and Nerd Font icons |
| `vim` | Vim with gruvbox theme |

**Shell integrations (both hosts)**

| Program | Description |
|---|---|
| `zoxide` | Smart directory jumper (`cd` aliased to `z`) |
| `fzf` | Fuzzy finder with zsh integration |

### Development (`features/dev/`)

| Module | Description |
|---|---|
| `neovim` | Config is managed outside Nix in `./nvim/` (Lua) and symlinked to `~/.config/nvim`; Nix installs LSP deps (`lua-language-server`, `stylua`, `tree-sitter`, `ripgrep`, `fd`) |
| `zed` | Zed editor with minimal config |

### Desktop — Cross-platform (`features/desktop/`)

| Module | Description |
|---|---|
| `ghostty` | Shared terminal config (font size 14, opacity 0.98, split keybinds, clipboard); `linux.nix` adds GTK options; `darwin.nix` adds `macos-option-as-alt` |
| `wezterm` | Alternative terminal — kanagawabones theme, FiraCode Nerd Font, 120fps |
| `mpv` | Video player — `gpu-next` renderer, hardware decode, lanczos scaling |
| `zathura` | PDF viewer with vim-style keybinds |

### Packages (both hosts)

**CLI tools**

`yazi` · `ripgrep` · `fd` · `eza` · `delta` · `tldr` · `ast-grep` · `ijq` · `jujutsu` · `gdb` · `gh` · `tre-command` · `btop` · `htop` · `lazygit` · `unzip` · `zip`

**Programming languages & runtimes**

`cargo` · `nodejs` · `python3` · `go` · `terraform` · `uv` · `tree-sitter`

---

## Home Manager — shiro only (Linux)

### Wayland & Desktop (`features/desktop/linux/`)

| Module | Description |
|---|---|
| `hyprland` | Tiling Wayland compositor — dual-monitor layout (`eDP-1` + `HDMI-A-1`), SUPER-based keybinds, workspace management (1–9), fcitx5 env vars, hypridle for screen timeout and suspend |
| `hyprlock` | Screen locker — blurred wallpaper, clock widget, password input field |
| `noctalia` | Custom bar (Catppuccin, FiraCode Nerd Font) — Launcher, Workspaces, MediaMini, Clock, SystemMonitor, Tray, Battery, Volume, ControlCenter |

**Wayland utilities**

| Package | Description |
|---|---|
| `grim` + `slurp` + `grimblast` | Screenshot capture |
| `wf-recorder` | Screen recording |
| `wl-clipboard` | Wayland clipboard |
| `hypridle` | Idle daemon (brightness dimming, lock, DPMS, suspend) |
| `wlsunset` | Blue-light filter (sunrise 06:00 / sunset 19:00) |
| `swaynotificationcenter` | Notification center |

### Applications (Linux)

| Package | Description |
|---|---|
| `vesktop` | Discord client (Vencord-patched) |
| `alacritty` | Fallback terminal |
| `obsidian` | Markdown knowledge base |
| `obs-studio` | Screen recording and streaming |
| `vlc` | Media player |
| `calibre` | E-book management |
| `mcomix` | Comics reader |
| `keepassxc` | Password manager |
| `qbittorrent` | BitTorrent client |
| `bruno` | Open-source API client (Postman alternative) |
| `darktable` | Photo editing (Lightroom alternative) |
| `chromium` | Secondary browser |

### Containers (Linux)

| Package | Description |
|---|---|
| `podman` | Daemonless container engine |
| `podman-tui` | TUI for podman |
| `podman-desktop` | GUI for podman |

### Theming (Linux)

| Component | Value |
|---|---|
| GTK theme | `adw-gtk3-dark` |
| Icon theme | `Papirus-Dark` |
| Qt theme | Adwaita / adwaita-dark |
| Cursor | `catppuccin-mocha-dark` (size 16) |
| dconf color scheme | `prefer-dark` |

### Extra Packages (Linux-only)

`asdf-vm` · `lua` (with busted + luafilesystem) · `luarocks`

---

## Home Manager — kuro only (macOS)

### System Defaults (nix-darwin)

| Setting | Value |
|---|---|
| Dock | Autohide, no recent apps, minimize to app icon, no auto-rearrange spaces |
| Finder | Show all extensions, list view, path bar, status bar |
| Appearance | Dark mode |
| Keyboard | Key repeat rate 2, initial delay 15, key repeat enabled (no accent popup) |
| Scroll | Natural scroll disabled |
| Trackpad | Tap to click enabled |
| Touch ID sudo | Enabled (also works inside tmux via `pam_reattach`) |

### Homebrew Casks (declarative via nix-darwin)

| Cask | Description |
|---|---|
| `ghostty` | Terminal — macOS native build (installed via cask; config written by home-manager) |
| `discord` | Voice and text chat |
| `obs` | Screen recording and streaming |
| `vlc` | Media player |
| `qbittorrent` | BitTorrent client |

### Applications via nixpkgs (macOS)

`obsidian` · `keepassxc` · `bruno` · `vlc`

---

## Getting Started

### Prerequisites

- Git
- This repo cloned to `~/.dot`

```bash
git clone https://github.com/radar07/.dot ~/.dot
cd ~/.dot
```

### shiro — NixOS

On a fresh NixOS install, replace the generated config with this flake and rebuild:

```bash
# System configuration
sudo nixos-rebuild switch --flake ~/.dot#shiro

# User environment / dotfiles (run as your user, not root)
home-manager switch --flake ~/.dot#shiro
```

> If `home-manager` is not yet installed: `nix-shell -p home-manager --run "home-manager switch --flake ~/.dot#shiro"`

### kuro — macOS (first time)

```bash
# 1. Install Nix (multi-user, macOS)
sh <(curl -L https://nixos.org/nix/install)

# 2. Enable flakes (add to /etc/nix/nix.conf if not already present)
echo "experimental-features = nix-command flakes" | sudo tee -a /etc/nix/nix.conf

# 3. Bootstrap nix-darwin (installs darwin-rebuild into your PATH)
nix run nix-darwin -- switch --flake ~/.dot#kuro
```

### kuro — macOS (subsequent)

```bash
darwin-rebuild switch --flake ~/.dot#kuro
```

> `darwin-rebuild switch` handles both the system configuration and home-manager in a single command on kuro.

---

## Neovim

Neovim configuration lives in `./nvim/` and is intentionally managed outside Nix as plain Lua. Home-manager symlinks `~/.config/nvim` → `~/.dot/nvim` so changes take effect immediately without a rebuild. Nix only installs the external dependencies (LSP servers, formatters, CLI tools).
