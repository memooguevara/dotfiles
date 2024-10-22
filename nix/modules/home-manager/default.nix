{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./apps
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "IosevkaTerm" ]; })
    httpie # Better curl
    eza # Better ls
    fd # Better find
    neofetch
    wl-clipboard
  ];
}
