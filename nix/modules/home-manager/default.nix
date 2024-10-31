{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./apps
  ];
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["JetBrainsMono" "IosevkaTerm"];})
    curl
    httpie # Better curl
    eza # Better ls
    fd # Better find
    fastfetch
    wl-clipboard
  ];
}
