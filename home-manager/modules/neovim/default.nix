# I don't want Nix to manage my Neovim configuration...
{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    fd
    fzf
    ripgrep
    tree-sitter

    lua-language-server
    llvmPackages_latest.clang-tools
    stylua
  ];

  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dot/nvim";
}
