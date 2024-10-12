{ inputs, lib, config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrainsMono NFM";
	size = 18;
      };
      window.opacity = 0.95;
    };
  };
}
