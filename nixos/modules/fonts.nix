{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans # Japanese, Chinese, Korean sans-serif fonts
    noto-fonts-cjk-serif # Japanese, Chinese, Korean serif fonts
    nerd-fonts.fira-code
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.mononoki
    nerd-fonts.ubuntu-mono
  ];
}
