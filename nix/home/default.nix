{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  home = {
    username = "jguevara";
    homeDirectory = "/home/jguevara";
    stateVersion = "24.05";
#    pointerCursor = {
#      x11.enable = true;
#      gtk.enable = true;
#    };
  };
  programs.home-manager.enable = true;
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "IosevkaTerm" ]; })
    curl
    ffmpeg
    imagemagick
    lazygit
  ];
  programs = {
    alacritty = import ./programs/alacritty.nix {inherit pkgs;};
    fzf = import ./programs/fzf.nix {inherit config;};
    git = import ./programs/git.nix {inherit config;};
    nixvim = import ./programs/nixvim.nix {inherit config;};
    #neovim = import ./programs/neovim.nix {inherit config;};
    tmux = import ./programs/tmux.nix {inherit pkgs config;};
    wezterm = import ./programs/wezterm.nix {inherit pkgs;};
    zsh = import ./programs/zsh.nix {inherit pkgs;};
  };
}
