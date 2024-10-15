{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./apps
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "IosevkaTerm" ]; })
    curl
    eza # Better ls
    fd # Better find
    neofetch
    nixd # Nix LSP
    alejandra # Nix formatter
    xsel
  ];
}
