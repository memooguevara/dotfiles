{ inputs, lib, config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      import = with pkgs; [ alacritty-theme.tokyo-night ];
      font = {
        normal.family = "IosevkaTerm NFM";
	size = 18;
      };
      window.opacity = 0.95;
    };
  };
}
