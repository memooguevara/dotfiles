{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.nixvim.packages.${pkgs.system}.default
  ];

  programs.neovim = {
    enable = false;
    defaultEditor = true;
  };
}
