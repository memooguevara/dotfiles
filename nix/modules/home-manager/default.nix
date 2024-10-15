{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./apps
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "IosevkaTerm" ]; })
    curl
    neofetch
  ];
}
